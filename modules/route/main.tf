resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "my_vpc_route_table"
  }
}

resource "aws_route_table_association" "my_vpc_association" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.my_vpc_route_table.id
}

resource "aws_route" "my_vpc_internet_access" {
  route_table_id         = aws_route_table.my_vpc_route_table.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.internet_gateway_id
}