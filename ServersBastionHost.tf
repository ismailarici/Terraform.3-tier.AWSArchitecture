
# EC2
resource "aws_instance" "webserver1" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  key_name               = "KeyPair"

  user_data = file("apache.sh")

  tags = {
    Name = "WebServer1"
  }

}

resource "aws_instance" "webserver2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  subnet_id              = aws_subnet.public-subnet-2.id
  key_name               = "KeyPair"

  user_data = file("apache.sh")

  tags = {
    Name = "WebServer2"
  }

}
resource "aws_instance" "appserver1" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.appserver-sg.id]
  subnet_id              = aws_subnet.private-subnet-1.id
  key_name               = "KeyPair"

  tags = {
    Name = "AppServer1"
  }

}

resource "aws_instance" "appserver2" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.appserver-sg.id]
  subnet_id              = aws_subnet.private-subnet-2.id
  key_name               = "KeyPair"

  tags = {
    Name = "AppServer2"
  }

}

resource "aws_instance" "bastionhost" {
  ami                    = "ami-0d5eff06f840b45e9"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.BH-sg.id]
  subnet_id              = aws_subnet.public-subnet-1.id
  key_name               = "Keypair"



  tags = {
    Name = "BastionHost"
  }
}
