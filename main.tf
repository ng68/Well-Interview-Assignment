locals {
    s3_bucket_id = "s3bucket"
    log_bucket_id = "logbucket"
}

provider "aws" {
    version = "3.21.0"
}

resource "aws_s3_bucket" "logging_bucket" {
    bucket = local.log_bucket_id
    acl = "log-delivery-write"
}

module s3_bucket {
    source = ".//modules/s3bucket"
    bucket_id = local.s3_bucket_id
    log_bucket_id = local.log_bucket_id
    tags = {
        //Used for any tags that are needed
        Name = "my-bucket"
    }
}