provider "aws" {
  region = "us-east-1"  # Replace with your AWS region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "temp-bucket-terraform"  # Replace with a unique bucket name
  acl    = "private"

  tags = {
    Name        = "My Terraform S3 Bucket"
    Environment = "Dev"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
