# secret key
resource "tls_private_key" "ec2_private_key" {
  algorithm = "RSA"
  rsa_bits  = "2048"
}

# import key to key pair
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_private_key.public_key_openssh
}

resource "local_sensitive_file" "keypair_pem" {
  filename        = "${path.root}/.ssh/${var.key_name}.pem"
  content         = tls_private_key.ec2_private_key.private_key_pem
  file_permission = 600
}