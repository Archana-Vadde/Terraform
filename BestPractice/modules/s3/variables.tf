variable "s3_name"{
  type = string
  default = ""
}
variable "create" {
  type = bool
  default = false
  
}
variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}
variable "environment" {
  type = string
  default = ""  
}
variable "create_block_public_access" {
  type = bool
  default = true
}
variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = false
}
variable "s3_enable_encryption" {
  description = "Determines whether encryption will be created (affects all resources)"
  type        = bool
  default     = false
}
variable "s3_kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for s3"
  type        = string
  default = ""
}
variable "create_bucket_notification" {
  description = "Determines whether encryption will be created (affects all resources)"
  type        = bool
  default     = ""
}
variable "sqs_arn" {
  description = "arn of sqs service"
  type        = string
  default =  ""
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = false
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = false
}
variable "enable_encryption" {
  type        = bool
  description = "Whether or not to use encryption for SNS Topic. If set to `true` and no custom value for KMS key (kms_master_key_id) is provided, it uses the default `alias/aws/sns` KMS key."
  default     = false
}
variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default = ""
}
variable "sqs_arn" {}



  

  
