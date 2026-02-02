variable "service_account_key_file" {
  type = string
  description = "Path to the service account key file"
  
}

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud folder ID"
}

variable "default_zone" {
  type        = string
  description = "Default availability zone"
  default     = "ru-central1-a"
}

variable "ssh_public_key" {
  type = string
  description = "SSH public key for VM access"
}
