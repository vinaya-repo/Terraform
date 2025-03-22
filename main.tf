provider "aws" {
   region = "us-east-1"  # Replace with your AWS region
 }
 
resource "aws_s3_bucket" "example" {
   bucket = "test-bucket-terraform_vinaya"  # Replace with a unique bucket name
 
   tags = {
     Name        = "My Terraform S3 Bucket"
     Environment = "Dev"
   }
 }
 
 output "s3_bucket_name" {
   value = aws_s3_bucket.example.bucket
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