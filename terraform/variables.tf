
variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "service_account_key_file" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "network_name" {
  type    = string
  default = "diplom-network"
}

variable "subnet_a_cidr" {
  type    = string
  default = "10.10.1.0/24"
}

variable "subnet_b_cidr" {
  type    = string
  default = "10.10.2.0/24"
}

variable "subnet_d_cidr" {
  type    = string
  default = "10.10.3.0/24"
}

variable "k8s_cluster_name" {
  type    = string
  default = "diplom-k8s"
}

variable "k8s_k8s_version" {
  type    = string
  default = "1.31"
}

variable "node_group_name" {
  type    = string
  default = "diplom-nodes"
}

variable "node_cores" {
  type    = number
  default = 2
}

variable "node_memory" {
  type    = number
  default = 4
}

variable "node_disk_size" {
  type    = number
  default = 30
}

variable "node_count" {
  type    = number
  default = 2
}

variable "registry_name" {
  type    = string
  default = "diplom-registry"
}