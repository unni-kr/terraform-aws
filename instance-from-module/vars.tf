# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# -------------------------------------------------------

# variable "db_remote_state_bucket" {
#   description = "The name of the S3 bucket used for the database's remote state storage"
#   type = string
#   default = "crew-terraform-state-bucket"  
# }

# variable "db_remote_state_key" {
#   description = "The name of the key in the S3 bucket used for the database's remote state storage"
#   type = string
#   default = "instance-from-module/terraform.tfstate"
# }

# variable "db_remote_state_table" {
#   description = "name of dynamodb table"
#   type = string
#   default = "terraform-up-and-running-locks"
# }

variable "environment" {
  description = "environemnt where the resources are created. eg test/prod"
  type = string
}

variable "environemnt_config_variable" {
  description = "key value pair containning all configuration for every environment"
  type = map
}