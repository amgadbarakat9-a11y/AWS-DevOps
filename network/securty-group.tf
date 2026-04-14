
##  Public security group ##

resource "aws_security_group" "sg1" {
  name        = "allow_all_traffic_ipv4"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "public-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "allow1" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}


## private security group ##

resource "aws_security_group" "sg2" {
  name        = "private_SG"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "private-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh2" {
  security_group_id = aws_security_group.sg2.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "port" {
  security_group_id = aws_security_group.sg2.id
  cidr_ipv4         = aws_vpc.vpc.cidr_block
  from_port         = 3000
  ip_protocol       = "tcp"
  to_port           = 3000
}


resource "aws_vpc_security_group_egress_rule" "allow2" {
  security_group_id = aws_security_group.sg2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}