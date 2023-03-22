resource "aws_security_group" "app_server_sg" {
  vpc_id      = data.aws_vpc.main_vpc.id
  name        = "app_server_sg"
  description = "Allow private access"

  #INBOUND CONNECTIONS 
  ingress {
    description = "Allow SSH from Bastion Host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  #OUTBOUND CONNECTIONS 
  egress {
    description = "Allows outbound connection"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "app_server_sg"
  }
}
