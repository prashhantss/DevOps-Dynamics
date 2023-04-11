
provider "aws" {
region     = "ap-south-1"
profile    = "default"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

lifecycle {
  prevent_destroy = true
}

  versioning {
    enabled = true
  }
 
tags = {
      Name        = "MYBucket"
    }
}