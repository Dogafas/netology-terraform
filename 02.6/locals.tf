locals {
  vm_web_name = "${var.vpc_name}-web-${var.vm_web_platform_id}"
  vm_db_name  = "${var.vpc_name}-db-${var.vm_db_platform_id}"
}
