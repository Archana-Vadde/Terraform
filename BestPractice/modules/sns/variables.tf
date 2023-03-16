variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {Name = "demosns"}
}

################################################################################
# Topic
################################################################################
variable "name" {
  description = "The name of the SNS topic to create"
  type        = string
  default     = "demo"
}
variable "use_name_prefix" {
  description = "Determines whether `name` is used as a prefix"
  type        = bool
  default     = false
}
variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK"
  type        = string
  default = ""
}

variable "lambda_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}

variable "topic_policy" {
  description = "An externally created fully-formed AWS policy as JSON"
  type        = string
  default     = null
}

variable "sqs_feedback" {
  description = "Map of IAM role ARNs and sample rate for success and failure feedback"
  type        = map(string)
  default     = {}
  # Example:
  # application_feedback = {
  #   failure_role_arn = "arn:aws:iam::11111111111:role/failure"
  #   success_role_arn = "arn:aws:iam::11111111111:role/success"
  #   success_sample_rate = 75
  # }
}



################################################################################
# Topic Policy
################################################################################

variable "create_topic_policy" {
  description = "Determines whether an SNS topic policy is created"
  type        = bool
  default     = true
}

variable "source_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_topic_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "enable_default_topic_policy" {
  description = "Specifies whether to enable the default topic policy. Defaults to `true`"
  type        = bool
  default     = true
}

variable "topic_policy_statements" {
  description = "A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage"
  type        = any
  default     = {}
}

################################################################################
# Subscription(s)
################################################################################
variable "enable_email_subscribe" {
    type = bool
    default = false
  
}
variable "enable_lambda_subscribe" {
    type = bool
    default = false
  
}
variable "enable_sqs_subscribe" {
    type = bool
    default = false
  
}
variable "email_endpoint" {
    type = string
    default = "archana41490@gmail.com"
}
variable "lambda_endpoint" {
    type = string
    default = "arn:aws:lambda:eu-west-2:859662211748:function:aa"
  
}
variable "sqs_endpoint" {
    type = string
    default = "arn:aws:sqs:eu-west-2:859662211748:aaaa"
  
}
