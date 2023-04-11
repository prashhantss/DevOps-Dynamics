provider "aws" {
region     = "ap-south-1"
profile    = "default"
}


resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "StateLock"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }