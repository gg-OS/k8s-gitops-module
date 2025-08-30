module "eks_al2" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  cluster_addons = {
    coredns                = {}
    kube-proxy             = {}
    vpc-cni                = {}
    eks-pod-identity-agent = {}        
    aws-ebs-csi-driver     = {          
      most_recent = true
    }
  }

  vpc_id                             = module.vpc.vpc_id
  subnet_ids                         = module.vpc.private_subnets
  cluster_endpoint_public_access     = true
  enable_cluster_creator_admin_permissions = true

  self_managed_node_groups = {
    example = {
      ami_type      = "AL2_x86_64"
      instance_type = "t3.small"
      min_size      = 1
      max_size      = 3
      desired_size  = 1
    }
  }

  tags = local.tags
}

module "ebs_csi_pod_identity_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.39"

  role_name_prefix      = "${local.name}-ebs-csi"
  attach_ebs_csi_policy = true
  tags                  = local.tags

  oidc_providers = {
    eks = {
      provider_arn               = module.eks_al2.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }
}


module "ebs_csi_pod_identity_assoc" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "~> 1.0"

  name = "${local.name}-ebs-csi"

  associations = {
    ebs_csi = {
      cluster_name   = module.eks_al2.cluster_name
      namespace      = "kube-system"
      service_account= "ebs-csi-controller-sa"
      role_arn       = module.ebs_csi_pod_identity_role.iam_role_arn
    }
  }

  tags = local.tags
}
