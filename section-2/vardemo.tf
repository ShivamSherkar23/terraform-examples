provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

resource "aws_security_group" "var_demo" {
  name = "test-variables"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }

  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = [var.vpn_ip]
  }
}