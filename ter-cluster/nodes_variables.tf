variable "vm_family" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "node image family"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "node platform_id"
}

variable "node_resources" {
  type        = map(object(
    {
      name          = string
      cores         = number
      memory        = number
      core_fraction = number
      preemptible   = bool
      disk_size     = number
  }))
  description = "nodes resources"
}

