terraform {
  backend "s3" {
    bucket = "prashhantss"
    key    = "global/s3/terraform/my.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tfstate"
  }
}



provider "aws" {
region     = "ap-south-1"
} 

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "tfstate"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockId"
  attribute {
    name = "LockId"
    type = "S"
  }
}

