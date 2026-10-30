terraform {
  backend "s3" {
    bucket         = "terraform-tf-state-bucket-cloudmaster"
    key            = "devops26/environments/dev/S3/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}