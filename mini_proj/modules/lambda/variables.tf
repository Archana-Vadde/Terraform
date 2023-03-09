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

#variable "kmskeyarn" { 
#}

  
