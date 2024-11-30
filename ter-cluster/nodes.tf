data "yandex_compute_image" "ubuntu" {
  family = var.vm_family
}

resource "yandex_compute_instance" "node1" {
  name        = var.node_resources.node1.name
  platform_id = var.vm_platform_id
  zone        = var.subnets.subnet1.zone
  resources {
    cores         = var.node_resources.node1.cores
    memory        = var.node_resources.node1.memory
    core_fraction = var.node_resources.node1.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.node_resources.node1.disk_size
    }
  }
  scheduling_policy {
    preemptible = var.node_resources.node1.preemptible
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

resource "yandex_compute_instance" "node2" {
  name        = var.node_resources.node2.name
  platform_id = var.vm_platform_id
  zone        = var.subnets.subnet2.zone
  resources {
    cores         = var.node_resources.node2.cores
    memory        = var.node_resources.node2.memory
    core_fraction = var.node_resources.node2.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.node_resources.node2.disk_size
    }
  }
  scheduling_policy {
    preemptible = var.node_resources.node2.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.dipl2.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "node3" {
  name        = var.node_resources.node3.name
  platform_id = var.vm_platform_id
  zone        = var.subnets.subnet3.zone
  resources {
    cores         = var.node_resources.node3.cores
    memory        = var.node_resources.node3.memory
    core_fraction = var.node_resources.node3.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.node_resources.node3.disk_size
    }
  }
  scheduling_policy {
    preemptible = var.node_resources.node3.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.dipl3.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

data "template_file" "inventory-template" {
  template = file("inventory.ini.tpl")
  vars = {
    n1_external = yandex_compute_instance.node1.network_interface[0].nat_ip_address
    n1_internal = yandex_compute_instance.node1.network_interface[0].ip_address
    n2_external = yandex_compute_instance.node2.network_interface[0].nat_ip_address
    n2_internal = yandex_compute_instance.node2.network_interface[0].ip_address
    n3_external = yandex_compute_instance.node3.network_interface[0].nat_ip_address
    n3_internal = yandex_compute_instance.node3.network_interface[0].ip_address
  }
}

resource "local_file" "inventory_file" {
  filename = "../kubespray/inventory.ini"
  content  = data.template_file.inventory-template.rendered
}

data "template_file" "k8s-cluster-template" {
  template = file("k8s-cluster.yml.tpl")
  vars = {
    suppl_ip = yandex_compute_instance.node1.network_interface[0].nat_ip_address
  }
}

resource "local_file" "k8s_cluster_file" {
  filename = "../kubespray/group_vars/k8s_cluster/k8s-cluster.yml"
  content  = data.template_file.k8s-cluster-template.rendered
}
