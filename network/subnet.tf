resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet1_cidr

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet2_cidr

  tags = {
    Name = "private_subnet"
  }
}