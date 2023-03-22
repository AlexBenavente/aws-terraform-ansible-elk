resource "aws_instance" "logstash" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.logstash_sg.id]
  key_name               = var.my_keypair
  #count                 = var.number_of_instances

  tags = {
    Name = "elk_logstash" #_${count.index + 1}"
  }
}

resource "aws_ebs_volume" "ebs_logstash" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = false

  tags = {
    Name = "EBS_Logstash"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.logstash.id
  volume_id   = aws_ebs_volume.ebs_logstash.id
}
