resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name= "Test"
    }
  
}

resource "aws_s3_bucket" "name" {
  bucket = "harshithkumar-terraform-bucket-2025"
}
