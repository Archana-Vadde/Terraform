variable "region" {
  type = string
  default = "eu-west-2"
}
variable "project" {
  default = "test1"
  
}
variable "createdby" {
  default = "GS" 
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