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