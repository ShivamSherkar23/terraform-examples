resource "aws_instance" "myec2" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0baeb75613d94aaff", "sg-5ab68946"]
  key_name = "terraform"
  subnet_id = "subnet-51f1d570"

  tags = {
    Name = "manual"
  }
}
