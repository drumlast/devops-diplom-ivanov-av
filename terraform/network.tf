resource "yandex_vpc_network" "this" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet_a" {
  name           = "diplom-subnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_a_cidr]
}

resource "yandex_vpc_subnet" "subnet_b" {
  name           = "diplom-subnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_b_cidr]
}

resource "yandex_vpc_subnet" "subnet_d" {
  name           = "diplom-subnet-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_d_cidr]
}