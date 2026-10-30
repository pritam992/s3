resource "aws_s3_bucket" "demo" {
  bucket = var.s3_name

  tags = {
    owner        = "project1"
    Environment = "Dev"
  }
}