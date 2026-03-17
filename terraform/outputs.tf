output "k8s_cluster_name" {
  value = yandex_kubernetes_cluster.k8s.name
}

output "k8s_cluster_id" {
  value = yandex_kubernetes_cluster.k8s.id
}

output "registry_id" {
  value = yandex_container_registry.this.id
}