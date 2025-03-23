resource "aws_instance" "example" {
  ami           = "ami-08b5b3a93ed654d19"  # ✅ Replace with a valid AMI ID from AWS CLI
  instance_type = "t2.micro"

  tags = {
    Name = "My Terraform EC2 Instance"
  }
}
