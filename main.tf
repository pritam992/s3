resource "aws_s3_bucket" "demo" {
  bucket = var.s3_name

  tags = {
    owner        = "project1"
    Environment = "Dev"
  }
}

# 2. Enable Versioning using the standalone resource
resource "aws_s3_bucket_versioning" "demo_versioning" {
  bucket = aws_s3_bucket.demo.id
  
  versioning_configuration {
    status = "Enabled"
  }
}