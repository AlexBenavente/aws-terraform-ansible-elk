# DEFINING ALL VARIABLES
variable "aws_owner_id" {
  description = "Contains the Owner ID of the ami"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami for my project"
  type        = string
}

variable "vpc_name" {
  description = "Name of the vpc for my project"
  type        = string
}

variable "private_subnet_name" {
  description = "name of the private subnet"
  type        = string
}

variable "ec2_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t3.medium"
}

variable "my_keypair" {
  default = "elk_keypair"
}

variable "elasticsearch_sg" {
  description = "name of the security group for elasticsearch"
  type        = string
}

variable "number_of_instances" {
  description = "Amount of instances for my public subnet"
}
