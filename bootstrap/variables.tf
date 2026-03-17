variable "token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "bucket_name" {
  type = string
}

variable "terraform_service_account_name" {
  type    = string
  default = "terraform-sa"
}