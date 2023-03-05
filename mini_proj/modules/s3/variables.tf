variable "tags" {
  description = "Tag map for the resource"
  type        = map(string)
  default     = {}
}
variable "s3_bucket_name" {
  description = "s3 bucket names"
  type        = string
  default     = "demo9m8n7b"
}
variable "name" {
  type = string
  default = "demokey"
  
}
variable "queueoutput" {

  
}

  
