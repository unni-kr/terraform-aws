# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# -------------------------------------------------------

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  type        = string
}


variable "instance_count" {
  description = "The number of EC2 Instances to run"
  type        = string
}

variable "ami_id" {
  description = "The id of ami used for ec2 instance"
  type        = string
}

variable "instance_name" {
  description = "name of instance"
  type = string
}
