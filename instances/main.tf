provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "example" {
  ami           = "${data.aws_ami.ubuntu_ami.image_id}"
  instance_type = "t2.micro"
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

terraform {
  backend "s3" {
    shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
    # Replace this with your bucket name!
    bucket         = "crew-terraform-state-bucket"
    key            = "instances/terraform.tfstate"
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}
