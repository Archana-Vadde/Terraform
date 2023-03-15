variable "dbcreate" {
  default = true
}

variable "name" {
  default = "demo"
}

variable "description" {
  default = ""
}
##################################################################
variable "crawlercreate" {
  default = true
}
variable "db" {
}
variable "role" {}
variable "schedule" {
  default = ""
}
variable "s3_path" {}
######################################################################
variable "jobcreate" {
  default = true
}
variable "connections" {
  type    = "list"
  default = []
}
variable "role_arn" {}
variable "dpu" {
  default = 2
}
########################################################################
variable "trigger-create" {
  default = true
}

variable "type" {
  description = "It can be CONDITIONAL, ON_DEMAND, and SCHEDULED."
  default     = "SCHEDULED"
}

variable "schedule" {}

variable "enabled" {
  default = true
}
variable "job_name" {}

variable "arguments" {
  type    = "map"
  default = {}
}

variable "timeout" {
  default = 2880
}
#####################################################################
variable "conn-create" {
  default = true
}
variable "url" {}

variable "user" {}

variable "pass" {}

variable "sg_ids" {
  default = ""
}

variable "subnet" {
  default = ""
}

variable "azs" {
  default = ""
}

variable "catalog_id" {
  default = ""
}

variable "type" {
  default = "JDBC"
}

variable "description" {
  default = ""
}

variable "criteria" {
  type    = "list"
  default = []
}





