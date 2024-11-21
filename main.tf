resource "databricks_storage_credential" "this" {
  name          = coalesce(var.storage_credential_name, "${var.iam_role_name}-creds")
  metastore_id  = var.metastore_id
  force_update  = true
  force_destroy = true

  aws_iam_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/${var.iam_role_name}"
  }
}

data "databricks_aws_unity_catalog_assume_role_policy" "this" {
  aws_account_id = var.aws_account_id
  role_name      = var.iam_role_name
  external_id    = databricks_storage_credential.this.aws_iam_role[0].external_id
}

data "databricks_aws_unity_catalog_policy" "this" {
  for_each = var.bucket_names

  aws_account_id = var.aws_account_id
  bucket_name    = each.value
  role_name      = var.iam_role_name
}

module "iam_uc_role_policy" {
  for_each = var.bucket_names
  source   = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version  = "~>5.0"

  name   = each.value
  policy = data.databricks_aws_unity_catalog_policy.this[each.key].json
}

module "iam_uc_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~>5.0"

  role_name                       = var.iam_role_name
  create_role                     = true
  create_custom_role_trust_policy = true
  custom_role_trust_policy        = data.databricks_aws_unity_catalog_assume_role_policy.this.json
  role_permissions_boundary_arn   = var.iam_role_boundary_arn
  custom_role_policy_arns         = [for k, v in var.bucket_names : module.iam_uc_role_policy[k].arn]
}
