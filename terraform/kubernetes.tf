
resource "yandex_kubernetes_cluster" "k8s" {
  name = var.cluster_name

  network_id = yandex_vpc_network.network.id

  master {
    regional {
      region = "ru-central1"
    }
  }
}

resource "yandex_kubernetes_node_group" "nodes" {
  cluster_id = yandex_kubernetes_cluster.k8s.id
  name       = "worker-nodes"

  instance_template {
    platform_id = "standard-v3"
    resources {
      memory = 4
      cores  = 2
    }
  }

  scale_policy {
    fixed_scale {
      size = 2
    }
  }
}
