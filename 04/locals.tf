locals {
  ssh_public_key = file(var.ssh_public_key_path)
}

locals {
  all_vms = [
    for vm in concat(
      yandex_compute_instance.web,
      values(yandex_compute_instance.db),
      [yandex_compute_instance.storage]
      ) : {
      group = (
        startswith(vm.name, "web-") ? "webservers" :
        startswith(vm.name, "db-") ? "databases" :
        "storage"
      )
      name = vm.name
      ip   = vm.network_interface[0].nat_ip_address
      fqdn = vm.fqdn
    }
  ]
}
