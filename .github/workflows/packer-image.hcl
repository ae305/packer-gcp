packersource "googlecompute" "ubuntu" {
  account_file = "path/to/your/service-account.json"
  source_image_project_id = "ubuntu-os-cloud"
  source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
  project_id = "your-gcp-project-id"
  image_name = "packer-ubuntu-2004"
  instance_name = "packer-ubuntu-instance"
  zone = "us-central1-a"
  machine_type = "n1-standard-1"
  image_description = "Packer built Ubuntu 20.04 image"
  ssh_username = "packer"
  image_labels = {
    "created_by" = "packer"
    "os" = "ubuntu-2004"
  }
  ssh_private_key_file = "path/to/your/private-key.pem"
  use_internal_ip = true
  omit_external_ip = true
  network = "default"
  subnetwork = "default"
}

build {
  sources = ["source.googlecompute.ubuntu"]

  provisioner "shell" {
  script = ["scripts/install-software.sh"]
  }
}