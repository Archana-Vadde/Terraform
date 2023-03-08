variable "name"{
  default = "demo9876543"
}

variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}
variable "kms_op_arn" {}
variable "sqs_op_arn" {}



  

  
