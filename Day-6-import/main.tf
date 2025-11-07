resource "aws_instance" "name" {
    ami = "ami-0157af9aea2eef346"
    instance_type = "t2.micro"
    key_name = "mykey1"
    tags= {
              "Name": "developer-2"
    }
  
}

#example command terraform import aws_instance.name i-05147978c61f9df86