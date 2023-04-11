provider "aws" {
region     = "ap-south-1"
}

provider "google" {
  project     = "My First Project"
  region      = "us-central1"
  zone        = "asia-south1"
  credintials   = "key.json"
}