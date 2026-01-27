variable "ssh_public_key" {
  description = "SSH public key used to access created VMs"
  type        = string
  sensitive   = false
}

variable "cloud_id" {
  description = "Yandex Cloud ID"
  type = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type = string
}

variable "service_account_key_file" {
  description = "Path to the service account key file"
  type = string
}

variable "default_zone" {
  description = "Default zone for Yandex Cloud resources"
  type        = string
}