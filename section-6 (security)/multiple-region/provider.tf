#for multiple aws account use the profile parameter for the specific aws account

provider "aws" {
  region     =  "us-east-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}

provider "aws" {
  alias      =  "aws02"
  region     =  "ap-south-1"
  shared_credentials_file = "C:\\Users\\Shivam Sherkar\\.aws\\credentials"
  profile                 = "default"
}