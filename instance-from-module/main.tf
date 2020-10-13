provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

module "instances" {
  source = "/home/krishnanunni_n_meon/iFlightCrew/iFlight-Creq-Infra/modules/instances"
  instance_type = var.instance_type
  db_remote_state_bucket = var.db_remote_state_bucket
  db_remote_state_key = var.db_remote_state_key
  db_remote_state_table = var.db_remote_state_table
}

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
