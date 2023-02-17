resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}


# create public subnet az1
# terraform create public subnet
resource "aws_subnet" "public_subnet_az1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az1

  tags = {
    Name = "public_subnet az1"
  }
}

# create public subnet az2
# terraform create public subnet
resource "aws_subnet" "public_subnet_az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_az2

  tags = {
    Name = "public_subnet az2"
  }
}


# create private subnet az1
# terraform create private subnet
resource "aws_subnet" "private_subnet_az1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_az1

  tags = {
    Name = "private_subnet az1"
  }
}

# create private subnet az2
# terraform create private subnet
resource "aws_subnet" "private_subnet_az2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_az2

  tags = {
    Name = "private_subnet az2"
  }
}

