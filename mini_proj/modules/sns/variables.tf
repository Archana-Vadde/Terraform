variable "name" {
    description = "sns topic"
    type = list(string)
    default = ["s_sns1","f_sns2"]
}
variable "environment" {
    type = string
    default = "dev"
  
}
variable "lambda_op_arn" {}
variable "kms_op_arn" {
  
}