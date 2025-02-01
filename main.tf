module "irsa-app" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.52.2"

  create_role = true
  role_name   = "${var.cluster_name}-etechapp"
  oidc_providers = {
    main = {
      provider_arn               = data.aws_iam_openid_connect_provider.oidc.arn
      namespace_service_accounts = ["default:${var.service_account_name}", "business:${var.service_account_name}"]
    }
  }
}

# Ensure that our pod can read s3 contents
data "aws_iam_policy_document" "s3_access" {
  statement {
    actions = ["s3:ListBucket", "s3:GetObject"]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*"
    ]
  }
}

resource "aws_iam_role_policy" "policy" {
  name   = "${var.cluster_name}-policy"
  role   = module.irsa-app.iam_role_name # Use role_name instead of iam_role_name
  policy = data.aws_iam_policy_document.s3_access.json
}


