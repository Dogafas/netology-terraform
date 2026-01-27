variable "ssh_public_key" {
  description = "SSH public key used to access created VMs"
  type        = string
  sensitive   = false
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "service_account_key_file" {
  type = string
}
