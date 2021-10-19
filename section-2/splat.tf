
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

#use the * for giving the output of all the indexes that is called as splat expression
#for a single value output use the particular index
output "arns" {
  value = aws_iam_user.lb[*].arn
}
