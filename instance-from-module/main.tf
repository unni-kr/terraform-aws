provider "aws" {
  region = "us-east-1"
  # shared_credentials_file only rquitred when aws credentials not set as environmenr variable
  # shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

module "instances" {
  # path to the module directory
  source = "../modules/instances"

  #arguments required for the module
  instance_type = local.environment_config["instance_type"]
  ami_id = local.environment_config["ami_id"]
  instance_name = "${var.environment}-instance"

}
  
# local variables
locals {
  environment_config = "${lookup(var.environemnt_config_variable, var.environment)}"
}

terraform {
  backend "s3" {
    # shared_credentials_file on;y rquitred when aws credentials not set as environmenr variable
    # shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
    # Replace this with your bucket name!
    bucket         = "crew-terraform-state-bucket"
    key            = "instance-from-module/terraform.tfstate"
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    # dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
