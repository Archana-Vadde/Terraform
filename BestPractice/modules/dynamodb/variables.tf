variable "create_table" {
  description = "Controls if DynamoDB table and associated resources are created"
  type        = bool
  default     = true
}
variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}
variable "environment" {
  description = "The environment to deploy to."
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod", "sit", "snd", "uat"], var.environment)
    error_message = "Valid values for var: environment are (dev, prod, sit, snd, uat)."
  }
}


# -------------------------------------------
# DynamoDB Variables
# -------------------------------------------

variable "db_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "demo-ddb"
}

variable "billing_mode" {
  description = "DynamoDB billing mode"
  type        = string
  default     = "PAY_PER_REQUEST" # or "PROVISIONED"
}
variable "hash_key" {
  description = "DynamoDB hash key"
  type        = string
  default     = "UserId"
}


variable "attr_name" {
  description = "DynamoDB attribute name"
  type        = string
  default     = "UserId"
}

variable "attr_type" {
  description = "DynamoDB attribute type"
  type        = string
  default     = "S"
}

  

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  type        = bool
  default     = true
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
  type        = string
  default     = ""
}
variable "dynamodb_item_create" {
  description = "Controls if DynamoDB table item and associated resources are created"
  type        = bool
  default     = true

}
