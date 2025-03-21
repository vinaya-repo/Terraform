provider "aws" {
  region = "us-east-1"  # Replace with your AWS region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket"  # Replace with a unique name
  acl    = "private"
  
  versioning {
    enabled = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Dev"
  }
}

