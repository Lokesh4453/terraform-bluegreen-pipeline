terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "bluegreen/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}