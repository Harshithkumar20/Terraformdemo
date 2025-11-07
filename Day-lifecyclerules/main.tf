#create vpc
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name= "vpc for terraform"
    }
  
}
#create subnet
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name= "public subnet"
    }
  
}

resource "aws_subnet" "name-2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name= "prvt subnet"
    }
  
}
#create ig
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
  
}

#create rt and edit 

resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id

    route {
     cidr_block=   "0.0.0.0/0"
     gateway_id = aws_internet_gateway.name.id
    }
  
}
#subnet association 
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
  
}
#create sg
resource "aws_security_group" "dev_sg" {
  name   = "allow_tls"
  vpc_id = aws_vpc.name.id
  tags = {
    Name = "dev-sg"
  }
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"   #all protocol 
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#create server
resource "aws_instance" "name" {
    ami = "ami-0157af9aea2eef346"
    subnet_id = aws_subnet.name.id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.dev_sg.id]
    associate_public_ip_address = true
}

  # lifecycle {
    #   create_before_destroy = true
    # }

    # lifecycle {
    #   ignore_changes = [tags,  ]
    # }
    
    # lifecycle {
    #   prevent_destroy = true
    # }
  