provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type    = list
  default = ["firstec2", "secondec2"]
}

data "aws_ami" "app_ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

variable "ami" {
  type = map
  default = {
    "us-east-1"  = "ami-02e136e904f3da870"
    "us-west-2"  = "ami-013a129d325529d4d"
    "ap-south-1" = "ami-041d6256ed0f2061c"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
#   ami           = lookup(var.ami, var.region)
  ami = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.loginkey.key_name
  count         = 2

  tags = {
    Name = element(var.tags, count.index)
  }
}


output "timestamp" {
  value = local.time
}