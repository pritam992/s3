resource "aws_iam_role" "test_role" {
  name = var.role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    owner        = "project1"
    Environment = "Dev"
  }
}

# 1. Define the Custom IAM Policy
resource "aws_iam_policy" "example_policy" {
  name        = var.policy_name
  path        = "/"
  description = "Grants read and write access to the state storage bucket"

  # Use jsonencode to write clean, native HCL that transforms into JSON
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::prjct1-dev-user-upload-ec2-s3",
          "arn:aws:s3:::prjct1-dev-user-upload-ec2-s3/*"
        ]
      }
    ]
  })
}

# 2. Attach the Custom Policy to a Role
resource "aws_iam_role_policy_attachment" "custom_attach" {
  role       = aws_iam_role.test_role.name # References your aws_iam_role resource
  policy_arn = aws_iam_policy.example_policy.arn
}
