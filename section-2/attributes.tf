provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "shivamsherkar-attribute-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}