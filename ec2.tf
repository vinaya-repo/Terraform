data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.latest_amazon_linux.id  # ✅ Automatically selects latest AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My Terraform EC2 Instance"
  }
}
