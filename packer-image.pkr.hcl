packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.2.1"
      source  = "github.com/hashicorp/googlecompute"
    }
  }
}

source "googlecompute" "linux" {
  credentials_file        = "project-2024-2-e9ea57e25b7e.json"
  source_image_project_id = ["ubuntu-os-cloud"]
  source_image            = "ubuntu-2404-noble-amd64-v20250725"
  project_id              = "project-2024-2"
  image_name              = "packer-ubuntu-2404-${uuidv4()}"
  instance_name           = "packer-ubuntu-2404"
  zone                    = "us-east4-a"
  machine_type            = "e2-small"
  image_description       = "Packer built Ubuntu 24.04 image"
  image_labels = {
    "created_by" = "packer"
    "os"         = "ubuntu-2404"
  }
  ssh_username         = "ubuntu"
  ssh_private_key_file = "ssh-key.pem"
  metadata = {
    "ssh-keys" = "ubuntu:${file("ssh-key.pem.pub")}"
  }
  use_internal_ip = false
  ssh_timeout     = "20m"
  #omit_external_ip       = true
  network    = "default"
  subnetwork = "default"
  tags       = ["default-allow-ssh"]
}

build {
  sources = ["source.googlecompute.linux"]

  provisioner "shell" {
    script = "test.sh"
  }
}