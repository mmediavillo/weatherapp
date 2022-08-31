resource "null_resource" "dockervol" {
  provisioner "local-exec" {
    command = "mkdir /home/constantine/weatherapp/noderedvol || true && sudo chown -R 1000:1000 /home/constantine/weatherapp/noderedvol/"
  }
}

module "image" {
  source = "./image"
  image_in = var.image[terraform.workspace]
}

resource "docker_image" "nodered_image" {
  name = var.image[terraform.workspace]
}

resource "random_string" "random" {
  count   = local.container_count
  length  = 4
  special = false
  upper   = false
}

resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", ["nodered", terraform.workspace, random_string.random[count.index].result])
  image = module.image.image_out
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path      = "${path.cwd}/noderedvol"
  }
}



