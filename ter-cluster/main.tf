resource "yandex_vpc_network" "dipl" {
  name = var.vpc_network_name
}

resource "yandex_vpc_subnet" "dipl1" {
  name           = var.subnets.subnet1.name
  zone           = var.subnets.subnet1.zone
  network_id     = yandex_vpc_network.dipl.id
  v4_cidr_blocks = var.subnets.subnet1.cidr
}

resource "yandex_vpc_subnet" "dipl2" {
  name           = var.subnets.subnet2.name
  zone           = var.subnets.subnet2.zone
  network_id     = yandex_vpc_network.dipl.id
  v4_cidr_blocks = var.subnets.subnet2.cidr
}

resource "yandex_vpc_subnet" "dipl3" {
  name           = var.subnets.subnet3.name
  zone           = var.subnets.subnet3.zone
  network_id     = yandex_vpc_network.dipl.id
  v4_cidr_blocks = var.subnets.subnet3.cidr
}
