## public Route Table ##

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "rt-public"
  }

}

  resource "aws_route" "public-rt1" {
    route_table_id = aws_route_table.rt1.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  
resource "aws_route_table_association" "P_rt1" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id
}


## private Route Table ##

resource "aws_route_table" "rt2" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "rt-private"
  }

}

resource "aws_route_table_association" "P_rt2" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.rt2.id
}
  

