output "instance_host" {
  value = aws_instance.ec2_instance.public_dns
}

output "instance_global_ips" {
  value = aws_instance.ec2_instance.*.public_ip
}

output "ssh_key_name" {
  value = aws_key_pair.ec2_key_pair.key_name
}