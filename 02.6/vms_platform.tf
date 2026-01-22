########################################
# Variables for WEB VM
########################################

variable "vm_web_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_platform_id" {
  type    = string
  default = "standard-v3"
}

# variable "vm_web_cores" {
#   type    = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type    = number
#   default = 2
# }

# variable "vm_web_core_fraction" {
#   type    = number
#   default = 50
# }

variable "vm_web_preemptible" {
  type    = bool
  default = true
}

variable "vm_web_nat" {
  type    = bool
  default = true
}

variable "vm_web_zone" {
  type    = string
  default = "ru-central1-a"
}

########################################
# Variables for DB VM
########################################

variable "vm_db_platform_id" {
  type    = string
  default = "standard-v3"
}

# variable "vm_db_cores" {
#   type    = number
#   default = 2
# }

# variable "vm_db_memory" {
#   type    = number
#   default = 2
# }

# variable "vm_db_core_fraction" {
#   type    = number
#   default = 20
# }

variable "vm_db_preemptible" {
  type    = bool
  default = true
}

variable "vm_db_nat" {
  type    = bool
  default = true
}

variable "vm_db_zone" {
  type    = string
  default = "ru-central1-b"
}

########################################
# New unified resources map
########################################

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
}

########################################
# Unified metadata
########################################

variable "metadata" {
  type = map(any)
}
