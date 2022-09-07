resource "aws_instance" "Ec2" {
  ami                         = "ami-06b0bb707079eb96a"
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet.id
  security_groups             = [aws_security_group.sg.id]
  key_name                    = "batchxvi-keypair"
  associate_public_ip_address = true
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "sg.tf"
  }
}