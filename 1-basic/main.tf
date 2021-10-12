provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

resource "aws_instance" "webserver" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = "t2.micro"
}