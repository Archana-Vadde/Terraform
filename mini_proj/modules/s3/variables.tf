variable "name" {
  type = string
  default = "demokey2"
}
variable "deletion_window_in_days" {
  type = number
  default = 7  
}

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
variable "queueoutput" {  
}


  
