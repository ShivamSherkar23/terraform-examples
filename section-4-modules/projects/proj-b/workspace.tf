provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

resource "aws_instance" "myec2" {
   ami = "ami-09e67e426f25ce0d7"
   instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prd     = "t2.large"
  }
}