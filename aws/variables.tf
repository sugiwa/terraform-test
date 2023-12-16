variable "instance_name" {
  type        = string
  default     = "terraform-ec2-instance"
  description = "Value of the Name tag for the EC2 instance"
}

variable "az_a" {
  default = "ap-northeast-1a"
}

variable "tag_name" {
  default = "terraform-ec2"
}

variable "key_name" {
  default = "aws-ec2-keypair-v1"
}