variable ext_port {
  type        = map(any)
}
# variable nodered_image {
#   type        = string
#   default     = "nodered/node-red:latest"
#   description = "image for container"
# }


variable "env" {
  type        = string
  default     = "dev"
  description = "Env to deploy to"
}

variable "nodered_image" {
  type        = map
  default     = {
    dev = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  description = "image for pods"
  }
}