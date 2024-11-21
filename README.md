# AWS Databricks Unity Role Terraform module
Terraform module for creation AWS Databricks Unity Role

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>5.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~>1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~>1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_iam_uc_role"></a> [iam\_uc\_role](#module\_iam\_uc\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~>5.0 |
| <a name="module_iam_uc_role_policy"></a> [iam\_uc\_role\_policy](#module\_iam\_uc\_role\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | ~>5.0 |

## Resources

| Name | Type |
|------|------|
| [databricks_storage_credential.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/storage_credential) | resource |
| [databricks_aws_unity_catalog_assume_role_policy.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/aws_unity_catalog_assume_role_policy) | data source |
| [databricks_aws_unity_catalog_policy.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/aws_unity_catalog_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | The AWS account ID | `string` | n/a | yes |
| <a name="input_bucket_names"></a> [bucket\_names](#input\_bucket\_names) | A map of bucket names to their IDs | `map(string)` | n/a | yes |
| <a name="input_iam_role_boundary_arn"></a> [iam\_role\_boundary\_arn](#input\_iam\_role\_boundary\_arn) | The ARN of the IAM permissions boundary | `string` | n/a | yes |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | The name of the IAM role | `string` | n/a | yes |
| <a name="input_metastore_id"></a> [metastore\_id](#input\_metastore\_id) | The ID of the Databricks metastore | `string` | n/a | yes |
| <a name="input_storage_credential_name"></a> [storage\_credential\_name](#input\_storage\_credential\_name) | The name of the Databricks storage credential. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_creds_id"></a> [storage\_creds\_id](#output\_storage\_creds\_id) | The ID of the Databricks storage credential. |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](./LICENSE)
