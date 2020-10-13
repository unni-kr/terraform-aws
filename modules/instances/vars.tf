# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# -------------------------------------------------------

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}

variable "instance_count" {
  description = "The number of EC2 Instances to run"
  type        = string
  default = 1
}

variable "db_remote_state_table" {
  description = "remote state dynamodb table name"
  type  = string
}
