terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.20.0"
    }
  }
}
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nodered"{
  name = var.nodered_image
}

locals {
  container_count = length(var.ext_port)
}



resource "docker_container" "nodered"{
  name = join("_", ["nodered", random_string.random[count.index].result])
  image = var.nodered_image
  count = local.container_count
  ports {
    internal = 1880
    external = var.ext_port[count.index]
  }
  volumes {
    container_path="/data"
    host_path = "/home/ansadm/docker-modules/nodered_vol"
  }
  }

  resource random_string random {
    length  = 5
    upper   = false
    lower   = true
    numeric  = true
    special = false
    count = local.container_count
  }
  

