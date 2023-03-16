variable "create" {
  description = "Determines whether resources will be created (affects all resources)"
  type        = bool
  default     = true
}
variable "name" {
 type = string
 default = "demo"
  
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

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
variable "deletion_window_in_days" {
  type = number
  default = 7  
}

variable "aliases_use_name_prefix" {
  description = "Determines whether the alias name is used as a prefix"
  type        = bool
  default     = false
}

variable "source_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s"
  type        = list(string)
  default     = []
}

variable "override_policy_documents" {
  description = "List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid`"
  type        = list(string)
  default     = []
}

variable "enable_default_policy" {
  description = "Specifies whether to enable the default key policy. Defaults to `true`"
  type        = bool
  default     = true
}

variable "key_owners" {
  description = "A list of IAM ARNs for those who will have full key permissions (`kms:*`)"
  type        = list(string)
  default     = []
}

variable "key_administrators" {
  description = "A list of IAM ARNs for [key administrators](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#key-policy-default-allow-administrators)"
  type        = list(string)
  default     = []
}

variable "key_users" {
  description = "A list of IAM ARNs for [key users](https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html#key-policy-default-allow-users)"
  type        = list(string)
  default     = []
}