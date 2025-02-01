variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "etechapp-eks-uKDGKMvN"
}

# variable "oidc_provider_arn" {
#   type        = string
#   description = "OIDC provider ARN for the EKS cluster"
#   default     = "https://oidc.eks.us-east-2.amazonaws.com/id/2B1FD62807A78C4A670FF914C3804881"
# }

variable "k8s_namespace" {
  type    = string
  default = "business"

}

variable "service_account_name" {
  type        = string
  description = "Kubernetes service account name"
  default     = "etechapp"
}

variable "s3_bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = "appcontent-app"
}
