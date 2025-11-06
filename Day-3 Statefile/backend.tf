terraform {
  backend "s3" {
    bucket = "123455789"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}

#when we need to keep state file in s3 we need backend.tf file and 
#whenever backend file is created need to run terraform init again