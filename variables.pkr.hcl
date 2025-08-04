variable "gcp_ssh_public_key_path" {
  type        = string
  description = "Path to the SSH public key file to be injected into the instance."
  default     = "ssh-key.pem.pub"
}

variable "gcp_credentials_path" {
  type        = string
  description = "Path to the GCP credentials JSON file."
  default     = "project-2024-2-e9ea57e25b7e.json"
}

variable "gcp_image_name" {
  type        = string
  description = "The name of the output Google Compute Image."
}

variable "gcp_source_image_name" {
  type        = string
  description = "The source image to use for the build."
}