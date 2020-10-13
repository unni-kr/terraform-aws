resource "aws_instance" "crew_test_instance" {
  ami           = "${data.aws_ami.ubuntu_ami.image_id}"
  instance_type = var.instance_type
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
    bucket         = var.db_remote_state_bucket
    key            = var.db_remote_state_key
    region         = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = var.db_remote_state_table
    encrypt        = true
  }
}
