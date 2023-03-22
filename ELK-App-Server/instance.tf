resource "aws_instance" "app_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]
  key_name               = var.my_keypair
  #count                  = var.number_of_instances

  tags = {
    Name = "App_server" #_${count.index + 1}"
  }
}

resource "aws_ebs_volume" "ebs_app_server" {
  availability_zone = "us-east-1a"
  size              = 50
  encrypted         = false

  tags = {
    Name = "EBS_App_Server"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.app_server.id
  volume_id   = aws_ebs_volume.ebs_app_server.id
}
