resource "aws_s3_bucket" "example" {
   bucket = "test-bucket-terraform-vinaya"  # Replace with a unique bucket name
 
   tags = {
     Name        = "My Terraform S3 Bucket"
     Environment = "Dev"
   }
 }