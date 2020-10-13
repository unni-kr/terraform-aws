# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# -------------------------------------------------------

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type = string
  default = "crew-terraform-state-bucket"  
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's remote state storage"
  type = string
  default = "instance-from-module/terraform.tfstate"
}

variable "db_remote_state_table" {
  description = "name of dynamodb table"
  type = string
  default = "terraform-up-and-running-locks"
}

variable "instance_type" {
  description = "type of ec2 instance"
  type = string
  default = ""
}

variable "ami_id" {
  description = "The id of ami used for ec2 instance"
  type        = string
  default = ""
}

variable "environment" {
  description = "environemnt where the resources are created. eg test/prod"
  type = string
}

variable "environemnt_config_variable" {
  type = map
}