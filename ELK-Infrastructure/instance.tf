resource "aws_instance" "bastion_host" {
  ami                    = data.aws_ami.aws_basic_ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]
  key_name               = var.my_keypair


  tags = {
    Name = "elk_bastionhost"
  }
}

resource "aws_eip" "bastion_eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.bastion_host.id
  allocation_id = aws_eip.bastion_eip.id
}
