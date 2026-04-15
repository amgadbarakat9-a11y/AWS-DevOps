resource "aws_instance" "EC20" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "key0"
  subnet_id   = aws_subnet.sub1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg1.id]

  tags = {
    Name = "EC2-public"
  }
}



resource "aws_instance" "EC21" {
  ami           = var.ami_id
  instance_type = "t3.micro"
  key_name = "key0"
  subnet_id   = aws_subnet.sub2.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
  provisioner "local-exec" {
    command = "echo Public IP: ${self.public_ip}"
  }

  
  tags = {
    Name = "APP-EC2"
  }
}

