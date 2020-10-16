resource "aws_network_acl" "my_vpc_network_acl" {
  vpc_id     = var.vpc_id
  subnet_ids = ["${var.subnet_id}"]
}

resource "aws_network_acl_rule" "allow__ingress_port_22" {
  network_acl_id = aws_network_acl.my_vpc_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.destination_cidr_block
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow__ingress_port_80" {
  network_acl_id = aws_network_acl.my_vpc_network_acl.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.destination_cidr_block
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow__ingress_ephermal_ports" {
  network_acl_id = aws_network_acl.my_vpc_network_acl.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.destination_cidr_block
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "allow__eggress_port_22" {
  network_acl_id = aws_network_acl.my_vpc_network_acl.id
  rule_number    = 400
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.destination_cidr_block
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "allow__egress_port_80" {
  network_acl_id = aws_network_acl.my_vpc_network_acl.id
  rule_number    = 500
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.destination_cidr_block
  from_port      = 80
  to_port        = 80
}