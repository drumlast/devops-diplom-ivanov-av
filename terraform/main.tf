
provider "yandex" {
  service_account_key_file = var.key_file
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
}

resource "yandex_vpc_network" "network" {
  name = "diplom-network"
}
