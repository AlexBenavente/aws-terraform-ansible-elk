resource "aws_instance" "kibana" {
  ami                    = data.aws_ami.aws_ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.kibana_sg.id]
  key_name               = var.my_keypair
  #count                 = var.number_of_instances

  tags = {
    Name = "elk_kibana" #_${count.index + 1}"
  }
}

resource "aws_ebs_volume" "ebs_kibana" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = false

  tags = {
    name = "EBS_Kibana"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.kibana.id
  volume_id   = aws_ebs_volume.ebs_kibana.id
}
