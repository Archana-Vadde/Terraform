variable "runtime" {
    type = string
    default = "python3.9"  
}
variable "name" {
    type = list
    default = ["demo-function"]
   
}
variable "environment" {
    type = string
    default = "dev"
  
}
variable "s_sns1_op_arn" {}
variable "f_sns_op_arn" {}
variable "lambda_handler" {
    description = "give filename & function name which you have mentioned in the file"
    default = "process_sqs.lambda_handler"
  
}

#variable "kmskeyarn" { 
#}

  
