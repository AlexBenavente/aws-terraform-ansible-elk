resource "aws_security_group" "logstash_sg" {
  vpc_id      = data.aws_vpc.main_vpc.id
  name        = "logstash_sg"
  description = "Allow private access"

  #INBOUND CONNECTIONS 
  ingress {
    description = "Allow SSH from Bastion Host"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }
  ingress {
    description = "ingress rules"
    from_port   = 5043
    to_port     = 5044
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
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
    Name = "logstash_sg"
  }
}
