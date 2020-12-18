resource "aws_kms_key" "kmskey" {
  description = "This key is used to encrypt the well-assignment-bucket"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2.7.0"
    }
  }
}

resource "aws_s3_bucket" "well-assignment-bucket" {
  bucket = var.bucket_id
  acl    = "private"

  tags = var.tags

  versioning {
    enabled = true
  }

  logging {
    target_bucket = var.log_bucket_id
    target_prefix = "log/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.kmskey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}