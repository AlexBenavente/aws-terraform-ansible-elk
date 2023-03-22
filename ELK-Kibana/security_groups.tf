resource "aws_security_group" "kibana_sg" {
  vpc_id      = data.aws_vpc.main.id
  name        = "kibana_sg"
  description = "Allow private access"

  # INBOUND CONNECTIONS
  ingress {
    description = "Allow SSH from Bastion Host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }
  ingress {
    description = "Allow kibana traffic"
    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #OUTBOUND CONNECTIONS
  egress {
    description = "egress rules"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
  tags = {
    Name = "kibana_sg"
  }
}
