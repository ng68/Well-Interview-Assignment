output "s3_bucket_id" {
  description = "ID of the created s3 bucket"
  value       = var.bucket_id
}

output "kms_key_id" {
  description = "KMS key id"
  value       = coalesce(aws_s3_bucket.well-assignment-bucket.server_side_encryption_configuration[*].rule[*].kms_master_key_id)
}

