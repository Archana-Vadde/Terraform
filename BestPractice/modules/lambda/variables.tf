variable "runtime" {
    type = string
    default = "python3.9"  
}
variable "name" {
    type = string
    default = "demo-function"
   
}
variable "dynamo_id" {
  
}
variable "create-function" {
    type = bool
    default = true
  
}
variable "create-event-invoke" {
    type = bool
    default = true
  
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
#variable "dynamodb_arn"{}
variable "sns_arn" {
  
}
variable "lambda_handler" {
    description = "give filename & function name which you have mentioned in the file"
    default = "process_sqs.lambda_handler"
  
}



  
