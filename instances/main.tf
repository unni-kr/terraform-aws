provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/krishnanunni_n_meon/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "example" {
  ami           = "${data.aws_ami.centos.image_id}"
  instance_type = "t2.micro"
}

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "image-type"
    values = ["machine"]
  }

  filter {
    name   = "name"
    values = ["CentOS Linux 7*"]
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
