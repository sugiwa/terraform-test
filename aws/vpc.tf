# VPC
resource "aws_vpc" "ec2_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = var.tag_name
  }
}

# Subnet
resource "aws_subnet" "ec2_public_subnet_1a" {
  vpc_id                  = aws_vpc.ec2_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.az_a
  map_public_ip_on_launch = true

  tags = {
    Name = var.tag_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ec2_igw" {
  vpc_id = aws_vpc.ec2_vpc.id
  tags = {
    Name = var.tag_name
  }
}

# Route Table
resource "aws_route_table" "ec2_rt" {
  vpc_id = aws_vpc.ec2_vpc.id
  tags = {
    Name = var.tag_name
  }
}

# Public Route
resource "aws_route" "ec2_rt_public" {
  route_table_id         = aws_route_table.ec2_rt.id
  gateway_id             = aws_internet_gateway.ec2_igw.id
  destination_cidr_block = "0.0.0.0/0"
}

# Relation Subnet and Route Table
resource "aws_route_table_association" "ec2_rt_associate" {
  subnet_id      = aws_subnet.ec2_public_subnet_1a.id
  route_table_id = aws_route_table.ec2_rt.id
}
