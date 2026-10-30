variable "s3_name" {
  type = string
  description = "bucket used for client file storage"
  #default = "prjct1-user-upload-ec2-s3"
}

variable "role_name" {
  type = string
  description = "role for demo"
}

variable "policy_name" {
  type = string
  description = "name of the policy"
}