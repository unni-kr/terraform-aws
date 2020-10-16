resource "aws_subnet" "my_vpc_subnet" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = var.subent_name
  }
}