output "k8s_cluster_name" {
  value = yandex_kubernetes_cluster.this.name
}

output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.this.id
}

output "registry_id" {
  value = yandex_container_registry.this.id
}

output "network_id" {
  value = yandex_vpc_network.this.id
}

output "subnet_ids" {
  value = [
    yandex_vpc_subnet.subnet_a.id,
    yandex_vpc_subnet.subnet_b.id,
    yandex_vpc_subnet.subnet_d.id
  ]
}
