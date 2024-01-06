#terraform {
#  required_providers {
#    yandex = {
#      source = "yandex-cloud/yandex"
#      version = "0.95.0"
#    }
#  }
#  required_version = ">= 0.13"
#}

resource "yandex_compute_instance" "db" {
  name = "reddit-app-db"
  labels = {
    tags = "reddit-app-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = "e9bar76d8cs50h36fr8n"
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
