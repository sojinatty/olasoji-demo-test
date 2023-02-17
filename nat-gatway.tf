# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
# terraform aws allocate elastic ip
resource "aws_eip" "eip_for_nat_gateway_az1" {
  vpc = true

  tags = {
    Name = "elastic ip az1"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az2 
# terraform aws allocate elastic ip
resource "aws_eip" "eip_for_nat_gateway_az2" {
  vpc = true

  tags = {
    Name = "elastic ip az2"
  }
}



resource "aws_nat_gateway" "natgateway_az1" {

  subnet_id     = aws_subnet.public_subnet_az1.id
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id


  tags = {
    Name = "nat gateway az1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

resource "aws_nat_gateway" "natgateway_az2" {

  subnet_id     = aws_subnet.public_subnet_az2.id
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id

  tags = {
    Name = "nat gateway az2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}

#create a private route table and add a route through natgateway az1
resource "aws_route_table" "private_route_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway_az1.id
  }



  tags = {
    Name = "private_route_nat_gw_az1"
  }
}

#create a private route table and add a route through natgateway az2

resource "aws_route_table" "private_route_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway_az2.id
  }



  tags = {
    Name = "private_route_nat_gw_az2"
  }
}


