output "irsa_role_outputs" {
  value = module.irsa-app
}

# Output the OIDC provider ARN
output "oidc_provider_arn" {
  value = data.aws_iam_openid_connect_provider.oidc.arn
}