resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name= "Test"
    }
  
}

resource "aws_s3_bucket" "name" {
  bucket = "harshithkumar-terraform-bucket-2025"
}

#target resource we can use to apply specific resource level only below command is the reference 
#terraform apply -target=aws_s3_bucket.name
#terraform plan  -target=aws_s3_bucket.name
#terraform destroy -target=aws_s3_bucket.name


#try skip resource 