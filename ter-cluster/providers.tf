terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket = "diplo-bucket"
    region = "ru-central1"
    key = "ter-cluster.tfstate"
    skip_region_validation = true
    skip_credentials_validation = true
    shared_credentials_file    = "../../diplo_keys/s3.key"
  }
}

provider "yandex" {
  service_account_key_file = file("../../diplo_keys/sa_auth_key.json")
  # token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}