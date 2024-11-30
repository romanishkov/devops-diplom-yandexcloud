variable "gitlab_vm_family" {
  type        = string
  default     = "gitlab"
  description = "gitlab image family"
}

variable "gitlab_vm_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "gitlab platform_id"
}

variable "gitlab_vm_resources" {
  type        = object(
    {
      name          = string
      cores         = number
      memory        = number
      core_fraction = number
      preemptible   = bool
      disk_size     = number
  })
  description = "gitlab vm resources"
}

