terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"  # Replace with your unique bucket name
    key            = "terraform.tfstate"          # Path of the state file in S3
    region         = "us-east-1"                  # Replace with your region
    dynamodb_table = "terraform-lock"            # DynamoDB table for state locking
    encrypt        = true                         # Encrypt the state file
  }
}
