resource "aws_instance" "crew_test_instance" {
  ami = var.ami_id == null ? data.aws_ami.ubuntu_ami.image_id : var.ami_id
  instance_type = var.instance_type
  count = var.instance_count

  subnet_id = var.subnet_id
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]

  tags = {
    Name = var.instance_name
  }

}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}
