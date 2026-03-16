resource "yandex_vpc_network" "this" {
  name = var.network_name
}

resource "yandex_vpc_subnet" "subnet_a" {
  name           = "${var.network_name}-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_a_cidr]
}

resource "yandex_vpc_subnet" "subnet_b" {
  name           = "${var.network_name}-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_b_cidr]
}

resource "yandex_vpc_subnet" "subnet_d" {
  name           = "${var.network_name}-d"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = [var.subnet_d_cidr]
}

resource "yandex_vpc_security_group" "k8s_public" {
  name       = "${var.k8s_cluster_name}-public-sg"
  network_id = yandex_vpc_network.this.id

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  ingress {
    protocol       = "TCP"
    description    = "HTTPS"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  ingress {
    protocol       = "ANY"
    description    = "Node to node"
    predefined_target = "self_security_group"
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "ANY"
    description    = "Allow all egress"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
