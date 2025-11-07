variable "ami_id" {
    default = "ami-0157af9aea2eef346"
    description = "ami for instance"
    type = string
  
}

variable "type" {
    default = "t2.micro"
    description = "type  for instance "
    type = string
}