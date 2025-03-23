resource "aws_instance" "example" {
  ami           = "ami-0abcdef1234567890"  # ✅ Replace with a valid AMI ID from AWS CLI
  instance_type = "t2.micro"

  tags = {
    Name = "My Terraform EC2 Instance"
  }
}
