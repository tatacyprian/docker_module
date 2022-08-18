variable ext_port {
  type        = list
  default     = [320300]
  description = "ports for container"
}
variable nodered_image {
  type        = string
  default     = "nodered/node-red:latest"
  description = "image for container"
}
