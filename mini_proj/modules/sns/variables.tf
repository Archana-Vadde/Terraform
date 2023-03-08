variable "name" {
    description = "sns topic"
    type = list(string)
    default = ["s_sns1","f_sns2"]
  
}
variable "lambda_op_arn" {}
