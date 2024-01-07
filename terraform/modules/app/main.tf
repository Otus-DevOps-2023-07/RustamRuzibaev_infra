terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.95.0"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"
  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }

  #network_interface {
  #  # Указан id подсети default-ru-central1-a
  #  subnet_id = var.subnet_id
  #  nat       = true
  #}

  network_interface {
    subnet_id = "e9bar76d8cs50h36fr8n"
    nat = true
  }
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
  #connection {
  #  type  = "ssh"
  #  host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
  #  user  = "ubuntu"
  #  agent = false
  #  # путь до приватного ключа
  #  private_key = file(var.private_key_path)
  #}

  #provisioner "file" {
  #  source      = "files/puma.service"
  #  destination = "/tmp/puma.service"
  #}
#
#  provisioner "remote-exec" {
#    script = "files/deploy.sh"
#  }

}
