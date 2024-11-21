variable "aws_account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "bucket_names" {
  description = "A map of bucket names to their IDs"
  type        = map(string)
}

variable "iam_role_boundary_arn" {
  description = "The ARN of the IAM permissions boundary"
  type        = string
}

variable "metastore_id" {
  description = "The ID of the Databricks metastore"
  type        = string
}

variable "iam_role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "storage_credential_name" {
  description = "The name of the Databricks storage credential."
  type        = string
  default     = null
}
