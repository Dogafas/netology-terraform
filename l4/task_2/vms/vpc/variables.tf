variable "env_name" {
  description = "Environment name (e.g. develop, stage, prod)"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud availability zone (e.g. ru-central1-a)"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "IPv4 CIDR blocks for the subnet"
  type        = list(string)
}
