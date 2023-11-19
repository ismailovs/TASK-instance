# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloud_2021"
  }
}

# Subnets
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true # To ensure the instance gets a public IP

  tags = {
    Name = "cloud_2021"
  }
}
# Elastic IP
resource "aws_instance" "elastic_ip" {
  instance_type = "t2.micro"
  ami           = var.ami["us-east-1"] # Choose an appropriate region for the elastic IP

  tags = {
    Name = "cloud_2021"
  }
}

# EC2 Instance
resource "aws_instance" "cloud_2021_instance" {
  ami             = var.ami["us-east-1"] # Choose an appropriate region for the instance
  instance_type   = var.instance_types[0] # Choose an instance type from the list
  key_name        = "cloud_2021"
  vpc_security_group_ids = [module.security_groups.security_group_id["web_sg"]]

  tags = {
    Name = "cloud_2021"
  }
}