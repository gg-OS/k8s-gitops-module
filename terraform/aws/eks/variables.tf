variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

variable "aws_profile" {
  description = "The AWS profile to use"
  type        = string
}

variable "tf_backend_bucket" {
    description = "The name of the bucket to create"
    type        = string
}

variable "tf_eks_state_key" {
    description = "The key to use for the EKS bucket"
    type        = string
}

variable "tf_backend_table" {
    description = "The name of the DynamoDB table to use for the EKS bucket"
    type        = string
}

variable "repo_name" {
    description = "The name of the repo to use for the EKS bucket"
    type        = string
}

variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
}