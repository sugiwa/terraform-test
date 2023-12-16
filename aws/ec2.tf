resource "aws_instance" "ec2_instance" {
  ami                         = "ami-09a81b370b76de6a2"
  instance_type               = "t2.micro"
  availability_zone           = var.az_a
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  subnet_id                   = aws_subnet.ec2_public_subnet_1a.id
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = var.instance_name
  }
}