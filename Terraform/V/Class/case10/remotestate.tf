provider "aws" {
region     = "ap-south-1"
profile    = "default"
}



terraform {
  backend "s3" {
    bucket   = "terraformbucket"
    key      = "terraform.tfstate"
    region   = "ap-south-1"
    dynamodb_table = "StateLock"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}