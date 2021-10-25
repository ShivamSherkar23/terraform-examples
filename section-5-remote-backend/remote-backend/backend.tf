
terraform {
  backend "s3" {
    bucket = "shivam-remote-backend"
    key    = "remotedemo.tfstate"   #name of the state file which we need
    region = "us-east-1"
    dynamodb_table = "s3-state-lock" #dynamodb table for the lock file entries
  }
}