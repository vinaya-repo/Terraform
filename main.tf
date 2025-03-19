name: Deploy S3 Bucket with Terraform

on:
  push:
    branches:
      - main  # Trigger on push to the main branch

jobs:
  deploy:
    runs-on: ubuntu-latest

    permissions:
      id-token: write   # Required for OIDC authentication
      contents: read    # Required to read repository content

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: latest

      - name: Configure AWS Credentials using OIDC
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: arn:aws:iam::${{ secrets.AWS_ACCOUNT_ID }}:role/GitHub-Terraform-Role  # Use secret for account ID
          role-session-name: GitHubTerraformSession
          aws-region: us-east-1  # Replace with your AWS region

      - name: Initialize Terraform
        run: terraform init

      - name: Plan Terraform
        run: terraform plan

      - name: Apply Terraform
        run: terraform apply -auto-approve

      - name: Output bucket name
        run: |
          BUCKET_NAME=$(terraform output -raw s3_bucket_name)
          echo "Bucket name: $BUCKET_NAME"
