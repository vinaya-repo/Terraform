output "s3_bucket_name" {
  value = aws_s3_bucket.example.bucket
}

output "ec2_instance_id" {
  value = aws_instance.example.id
}
