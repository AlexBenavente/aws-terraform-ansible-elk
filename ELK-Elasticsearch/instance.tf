resource "aws_instance" "elasticsearch" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.elasticsearch_sg.id]
  key_name               = var.my_keypair
  #count                 = var.number_of_instances

  tags = {
    Name = "elk_elasticsearch" #_${count.index + 1}"
  }
}

resource "aws_ebs_volume" "ebs_elasticsearch" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = false

  tags = {
    name = "EBS_Elasticsearch"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.elasticsearch.id
  volume_id   = aws_ebs_volume.ebs_elasticsearch.id
}
