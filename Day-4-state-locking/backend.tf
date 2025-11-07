terraform {
  backend "s3" {
    bucket = "harshithkumar-terraform-bucket-2025"
    key    = "terraform.tfvars"
    use_lockfile = true #to lock the statefile so that till my changes apply no other person can make changes 
    region = "us-east-1"
  }
}
