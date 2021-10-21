resource "aws_instance" "webserver" {
    ami = "ami-09e67e426f25ce0d7"
    instance_type = var.instance_type
}