# DEFINING ALL VARIABLES
variable "aws_owner_id" {
  description = "Contains the Owner ID of the ami"
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "aws_vpc_name" {
  description = "Name of the vpc of the project"
  type        = string
}

variable "ec2_type" {
  description = "Type of ec2 instance"
  type        = string
  default     = "t3.micro"
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "my_keypair" {
  default = "elk_keypair"
}

variable "number_of_instances" {
  description = "Number of instances"
}