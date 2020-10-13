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
