terraform {
  backend "s3" {
    bucket = "harshithkumar-terraform-bucket-2025"
    key    = "terraform.tfvars"
    region = "us-east-1"
  }
}
