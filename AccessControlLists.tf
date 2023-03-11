# public-nacl
resource "aws_network_acl" "public-nacl" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "YOUR IP ADDRESS/32" #enter your ip
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "YOUR IP ADDRESS/32" #enter your ip
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "public-nacl"
  }
}

resource "aws_network_acl_association" "public-nacl" {
  network_acl_id = aws_network_acl.public-nacl.id
  subnet_id      = aws_subnet.public-subnet-1.id

}
resource "aws_network_acl_association" "public-nacl2" {
  network_acl_id = aws_network_acl.public-nacl.id
  subnet_id      = aws_subnet.public-subnet-2.id

}

# private-nacl
resource "aws_network_acl" "private-nacl" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = "private-nacl"
  }
}

resource "aws_network_acl_association" "private-nacl" {
  network_acl_id = aws_network_acl.private-nacl.id
  subnet_id      = aws_subnet.private-subnet-1.id

}
resource "aws_network_acl_association" "private-nacl2" {
  network_acl_id = aws_network_acl.private-nacl.id
  subnet_id      = aws_subnet.private-subnet-2.id

}

# database-nacl
resource "aws_network_acl" "database-nacl" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 3306
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "10.0.0.0/16"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "database-nacl"
  }
}

resource "aws_network_acl_association" "database-nacl" {
  network_acl_id = aws_network_acl.database-nacl.id
  subnet_id      = aws_subnet.private-subnet-3.id

}
resource "aws_network_acl_association" "database-nacl2" {
  network_acl_id = aws_network_acl.database-nacl.id
  subnet_id      = aws_subnet.private-subnet-4.id

}


