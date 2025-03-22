terraform {
  backend "s3" {
    bucket         = "s3-backend"  # Replace with your unique bucket name
    key            = "terraform.tfstate"          # Path of the state file in S3
    region         = "us-east-1"                  # Replace with your region
    use_lockfile   = true            # DynamoDB table for state locking
    encrypt        = true                         # Encrypt the state file
  }
}
