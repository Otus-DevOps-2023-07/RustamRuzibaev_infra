source "yandex" "ubuntu16" {
    service_account_key_file = "/home/ram/otus/repos/secret/packer-base/key.json"
    folder_id = "b1gjifjhsf867vu0g4r2"
    source_image_family = "ubuntu-1604-lts"
    image_name = "reddit-base-${formatdate("MM-DD-YYYY", timestamp())}"
    image_family = "reddit-base"
    ssh_username = "ubuntu"
    platform_id = "standard-v1"
    use_ipv4_nat = true
    zone = "ru-central1-a"
    subnet_id = "e9bar76d8cs50h36fr8n"
}

build {
    sources = ["source.yandex.ubuntu16"]
    provisioner "shell" {
        name            = "ruby"
        script          = "./scripts/install_ruby.sh"
        execute_command = "sudo {{.Path}}"
    }

    provisioner "shell" {
        name            = "mongodb"
        script          = "./scripts/install_mongodb.sh"
        execute_command = "sudo {{.Path}}"
    }
}
