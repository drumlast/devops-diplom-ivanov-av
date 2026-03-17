output "storage_access_key" {
  value     = yandex_iam_service_account_static_access_key.sa_static_key.access_key
  sensitive = true
}

output "storage_secret_key" {
  value     = yandex_iam_service_account_static_access_key.sa_static_key.secret_key
  sensitive = true
}

output "terraform_sa_key_json" {
  value = jsonencode({
    id                 = yandex_iam_service_account_key.terraform_key.id
    service_account_id = yandex_iam_service_account.terraform.id
    created_at         = yandex_iam_service_account_key.terraform_key.created_at
    key_algorithm      = yandex_iam_service_account_key.terraform_key.key_algorithm
    public_key         = yandex_iam_service_account_key.terraform_key.public_key
    private_key        = yandex_iam_service_account_key.terraform_key.private_key
  })
  sensitive = true
}