variable "aws_region" {
  description = "The AWS region where resources will be deployed"
  type        = string
}

variable "tf_backend_bucket" {
    description = "The name of the bucket to create"
    type        = string
}

variable "tf_backend_table" {
    description = "The name of the DynamoDB table to use for the EKS bucket"
    type        = string
}

variable "tf_flux_state_key" {
    description = "The key to use for the Flux state bucket"
    type        = string
}

variable "cluster_name" {
    description = "The name of the EKS cluster"
    type        = string
}

variable "author_email" {
    description = "The email address of the author"
    type        = string
}

variable "author_name" {
    description = "The name of the author"
    type        = string
}

variable "repo_url" {
    description = "The URL of the repo to use for the EKS bucket"
    type        = string
}
