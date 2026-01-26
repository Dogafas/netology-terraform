variable "vms" {
  type = list(object({
    group = string
    name  = string
    ip    = string
    fqdn  = string
  }))
}

resource "local_file" "inventory" {
  content = templatefile("${path.module}/template.tmpl", {
    vms = var.vms
  })

  filename = "${path.module}/../../ansible_inventory.ini"

  depends_on = [var.vms]
}
