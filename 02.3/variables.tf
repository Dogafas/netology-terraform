########################################
# Cloud configuration
########################################

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID. See: https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID. See: https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default availability zone. See: https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "CIDR block for subnet. See: https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "Name for VPC network and subnet"
}

########################################
# SSH configuration
########################################

variable "vms_ssh_public_root_key" {
  type        = string
  description = "Public SSH key for VM access (ssh-ed25519 or ssh-rsa)"
}

########################################
# Service account key
########################################

variable "service_account_key_file" {
  type        = string
  description = "Absolute path to the JSON key file of the service account"
}

