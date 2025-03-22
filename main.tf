provider "aws" {
  region = "us-east-1"  # ✅ Ensure this is the correct region
}

# ✅ Create S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-1234567890"  # Change to a globally unique name
  force_destroy = true  # Allows bucket deletion with Terraform

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

# ✅ Enable versioning for state files
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# ✅ Create DynamoDB table for state locking
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
