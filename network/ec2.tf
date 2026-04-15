resource "aws_instance" "EC20" {
  ami           = "ami-07062e2a343acc423"
  instance_type = "t3.micro"
  key_name = aws_key_pair.key.key_name
  subnet_id   = aws_subnet.sub1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg1.id]

  tags = {
    Name = "EC2-public"
  }
}



resource "aws_instance" "EC21" {
  ami           = "ami-07062e2a343acc423"
  instance_type = "t3.micro"
  key_name = aws_key_pair.key.key_name
  subnet_id   = aws_subnet.sub2.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
  provisioner "local-exec" {
    command = "echo Public IP: ${self.public_ip}"
  }

  
  tags = {
    Name = "APP-EC2"
  }
}

resource "aws_key_pair" "key" {
  key_name   = "key"
  public_key = file("${path.module}/id_rsa.pub")
}

  