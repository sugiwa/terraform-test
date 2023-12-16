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

resource "aws_secretsmanager_secret" "ec2_secret" {
  name = var.key_name
}

resource "aws_secretsmanager_secret_version" "ec2_secret" {
  secret_id     = aws_secretsmanager_secret.ec2_secret.id
  secret_string = tls_private_key.ec2_private_key.private_key_pem
}