provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

module "instances" {
  # path to the module directory
  source = "../modules/instances"

  # instance_type = local.environment_config.test.instance_type
  # ami_id = local.environment_config.test.ami_id
  # instance_name = local.env_name

  instance_type = var.environemnt_config_variable["${var.environment}"]["instance_type"]
  ami_id = var.environemnt_config_variable["${var.environment}"]["ami_id"]
  instance_name = "${var.environment}-instance"
}
  
# local variables
# locals {
#   env_name = yamldecode(file("${path.module}/environemt.yml")).environment_name
#   environment_config = yamldecode(file("${path.module}/environemt_config.yml"))
# }

terraform {
  backend "s3" {
    shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
    # Replace this with your bucket name!
    bucket         = "crew-terraform-state-bucket"
    key            = "instance-from-module/terraform.tfstate"
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
