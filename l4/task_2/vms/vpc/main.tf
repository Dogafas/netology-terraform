terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_vpc_network" "this" {
  name = "${var.env_name}-network"
}

resource "yandex_vpc_subnet" "this" {
  name           = "${var.env_name}-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.v4_cidr_blocks
}
