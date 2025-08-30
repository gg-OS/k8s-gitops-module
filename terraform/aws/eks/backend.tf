terraform {
  backend "s3" {
    bucket         = var.tf_backend_bucket
    key            = var.tf_eks_state_key
    region         = var.aws_region
    dynamodb_table = var.tf_backend_table
    encrypt        = true
  }
}