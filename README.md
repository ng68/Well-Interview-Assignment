## Description
Well Interview assignment - Julian Ng

## Instructions

Before running anything, configure the aws provider credentials and follow standard AWS setup: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

(Using latest Terraform version - 0.14.3)
Scripts to run in order:
Terraform:
- terraform init
- terraform validate .
Go Test
- cd tests
- go test module_test.go

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_id | ID of the bucket to be created in the module | `string` | n/a | yes |
| log\_bucket\_id | ID of the bucket to be used for logging | `string` | n/a | yes |

## Outputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| s3\_bucket\_id | ID of the created s3 bucket | `string` | n/a | yes |
| kms\_key\_id | KMS key id | `string` | n/a | yes |