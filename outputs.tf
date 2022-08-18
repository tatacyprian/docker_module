output "container_name" {
  value  = docker_container.nodered[*].name
  sensitive   = false
  description = "container name"
}
output "container_ip" {
  value = [for i in docker_container.nodered[*]: join(":", [i.ip_address, i.ports[0]["external"]])]
  description = "ip address and port"
}

