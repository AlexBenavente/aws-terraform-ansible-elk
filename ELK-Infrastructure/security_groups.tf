resource "aws_security_group" "bastion_host_sg" {
  vpc_id = data.aws_vpc.main_vpc.id

  ingress {
    description = "Allows SSH into Bastion Host"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  tags = {
    Name = "bastion_host_sg"
  }


  egress {
    description = "Allows access to the world"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
  }
}
