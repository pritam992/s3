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

# 2. Tighten Public Access Controls
resource "aws_s3_bucket_public_access_block" "demo_public_access" {
  bucket = aws_s3_bucket.demo.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}