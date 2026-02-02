# -----------------------------
# Cloud-init template
# -----------------------------
data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file(var.ssh_public_key)
  }
}

# -----------------------------
# VPC modules
# -----------------------------
module "vpc_dev_a" {
  source         = "./vms/vpc"
  env_name       = "develop-a"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.0.1.0/24"]
}

module "vpc_dev_b" {
  source         = "./vms/vpc"
  env_name       = "develop-b"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["10.0.2.0/24"]
}

# -----------------------------
# VM 1 — marketing (zone A)
# -----------------------------
module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name       = "marketing"
  network_id     = module.vpc_dev_a.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc_dev_a.subnet_id]

  instance_name  = "marketing"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    project = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

# -----------------------------
# VM 2 — analytics (zone B)
# -----------------------------
module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name       = "analytics"
  network_id     = module.vpc_dev_b.network_id
  subnet_zones   = ["ru-central1-b"]
  subnet_ids     = [module.vpc_dev_b.subnet_id]

  instance_name  = "analytics"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = {
    project = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}
# -----------------------------
# Outputs
# -----------------------------
output "marketing_vm_ip" {
  value       = module.marketing_vm.external_ip_address[0]
  description = "Marketing VM External IP Address"
}

output "analytics_vm_ip" {
  value       = module.analytics_vm.external_ip_address[0]
  description = "Analytics VM External IP Address"
}


# -----------------------------
# End
# -----------------------------