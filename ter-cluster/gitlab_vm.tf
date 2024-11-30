data "yandex_compute_image" "gitlab" {
  family = var.gitlab_vm_family
}

resource "yandex_compute_instance" "gitlab_vm" {
  name        = var.gitlab_vm_resources.name
  platform_id = var.gitlab_vm_platform_id
  zone        = var.subnets.subnet1.zone
  resources {
    cores         = var.gitlab_vm_resources.cores
    memory        = var.gitlab_vm_resources.memory
    core_fraction = var.gitlab_vm_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.gitlab.image_id
      size = var.gitlab_vm_resources.disk_size
    }
  }
  scheduling_policy {
    preemptible = var.gitlab_vm_resources.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.dipl1.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
