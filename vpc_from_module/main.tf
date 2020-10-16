provider "aws" {
  region = "us-east-1"
  # shared_credentials_file only rquitred when aws credentials not set as environment variable
  # shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

module "vpc" {
  # path to the module directory
  source = "../modules/vpc"

  #arguments optional for the module. default values are provided in module. if you need to provide values, please uncomment vars.tf file
  vpc_cidr_block   = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  vpc_name         = var.vpc_name
}

module "public_subnet" {
  source = "../modules/subnet"

  vpc_id                  = module.vpc.instance_vpc_id
  subnet_cidr_block       = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
  subent_name             = "public_subnet"
}

module "private_subnet" {
  source = "../modules/subnet"

  vpc_id                  = module.vpc.instance_vpc_id
  subnet_cidr_block       = var.private_subnet_cidr_block
  map_public_ip_on_launch = false
  subent_name             = "private_subnet"
}

module "security_group" {
  source = "../modules/security_group"

  vpc_id = module.vpc.instance_vpc_id
}

module "network_acl" {
  source = "../modules/network_acl"

  vpc_id    = module.vpc.instance_vpc_id
  public_subnet_id = module.public_subnet.subnet_id
  private_subnet_id = module.private_subnet.subnet_id
  #destination_cidr_block is optional. default value is provided in module
  # destination_cidr_block = var.destination_cidr_block
}

module "internet_gateway" {
  source = "../modules/internet_gateway"

  vpc_id = module.vpc.instance_vpc_id
}

module "route" {
  source = "../modules/route"

  vpc_id              = module.vpc.instance_vpc_id
  public_subnet_id    = module.public_subnet.subnet_id
  internet_gateway_id = module.internet_gateway.my_vpc_internet_gateway_id
  #destination_cidr_block is optional. default value is provided in module
  # destination_cidr_block = var.destination_cidr_block
}

terraform {
  backend "s3" {
    # shared_credentials_file on;y rquitred when aws credentials not set as environmenr variable
    # shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"

    # Replace this with your bucket name!
    bucket = "crew-terraform-state-bucket"
    key    = "vpc-from-module/terraform.tfstate"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    #use only when you need dynamodb locking
    # dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}