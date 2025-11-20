resource "aws_vpc" "project_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="project_vpc"
    }
  
}

resource "aws_subnet" "name-1" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.project_vpc.id
    tags = {
        Name= "private"
    }
  
}

resource "aws_subnet" "name-2" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.project_vpc.id
    tags = {
        Name= "private"
    }
  
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.project_vpc.id
    tags = {
      Name ="INTERNET_GATE"
    }

  
}
resource "aws_route_table" "rout" {
    vpc_id = aws_vpc.project_vpc.id
    tags = {
      Name ="route-table"
      
    }
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
      }
  
}
resource "aws_route_table_association" "public-rt" {
    route_table_id = aws_route_table.rout.id
    subnet_id = aws_subnet.name-1.id
    
  
}
resource "aws_security_group" "cust_sg" {
    name = "cust_sg"
    description = "Allow TLS inbound traffics"
    vpc_id = aws_vpc.project_vpc.id

    
    ingress {
    description = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

}

####instance creation
resource "aws_instance" "ec2" {
    ami = "ami-0157af9aea2eef346"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name-1.id
    tags = {
      Name ="harsh"
    }
  
}