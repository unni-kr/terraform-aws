output "vpc_security_group_id" {
  value = module.security_group.vpc_security_group_id
}

output "subnet_id" {
  value = module.public_subnet.subnet_id
}
