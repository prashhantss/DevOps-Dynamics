
terraform {
  backend "s3" {
    bucket = "prashhantss"
    key    = "my.tfstate"
    region = "ap-south-1"
    dynamodb_table = "tfstate"
  }
}