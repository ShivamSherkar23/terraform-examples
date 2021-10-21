#provisioners are used to execute scripts on local or remote  machine as part of resource creation

#we can use the local-exec instead of remote to execute the script on the local machine i.e where the terraform apply command is executing

resource "aws_instance" "myec2" {
  ami                    = "ami-02e136e904f3da870"
  instance_type          = "t2.micro"
  key_name               = "terraform"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("./terraform.pem")
      host        = self.public_ip
    }
  }
}

### security group resource to allow the terraform provisioner from laptop to connect to EC2 Instance via SSH.

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}