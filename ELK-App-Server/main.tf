# DATA SOURCE FOR AMI
data "aws_ami" "ubuntu" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }
}

# DATA SOURCE FOR VPC
data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# DATA SOURCE FOR SUBNET
data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}
