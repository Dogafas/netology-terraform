########################################
# 1. Создание 3 одинаковых дисков (count)
########################################

resource "yandex_compute_disk" "data_disk" {
  count = 3

  name = "data-disk-${count.index + 1}"
  type = "network-hdd"
  size = 1
  zone = var.default_zone
}

########################################
# 2. Создание одиночной ВМ storage
#    (count и for_each запрещены)
########################################

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v1"
  zone        = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  ########################################
  # dynamic secondary_disk + for_each
  ########################################

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.data_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }
}
