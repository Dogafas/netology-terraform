output "subnet" {
  description = "Full subnet object"
  value       = yandex_vpc_subnet.this
}

output "subnet_id" {
  description = "Subnet ID"
  value       = yandex_vpc_subnet.this.id
}

output "network_id" {
  description = "Network ID"
  value       = yandex_vpc_network.this.id
}
