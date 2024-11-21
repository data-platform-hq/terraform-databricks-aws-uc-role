output "storage_creds_id" {
  description = "The ID of the Databricks storage credential."
  value       = databricks_storage_credential.this.id
}
