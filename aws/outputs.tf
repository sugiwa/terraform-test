output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "instance_global_ips" {
  value = aws_instance.ec2_instance.*.public_ip
}

output "secrets_manager_secret" {
  value = aws_secretsmanager_secret.ec2_secret.id
}

output "secrets_manager_secret_version" {
  value = aws_secretsmanager_secret_version.ec2_secret.id
}

output "secrets_manager_private_key" {
  value     = tls_private_key.ec2_private_key.private_key_pem
  sensitive = true
}