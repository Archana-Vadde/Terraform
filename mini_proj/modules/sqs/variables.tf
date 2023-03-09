variable "name" {
    type = list
    default = ["demo"]
}
variable "environment" {
  type = string
  default = "dev"
  
}
variable "delay_seconds" {
    type = number
    default = 0
}
variable "kms_op_arn"{}
variable "s3_op_arn" {}
variable "lambda_op_arn" {}



variable "retention_period" {
  description = "Time (in seconds) that messages will remain in queue before being purged"
  type = number
  default = 60
}

variable "visibility_timeout" {
  description = "Time (in seconds) that consumers have to process a message before it becomes available again"
  type = number
  default = 60
}

variable "receive_count" {
  description = "The number of times that a message can be retrieved before being moved to the dead-letter queue"
  type = number
  default = 5
}

