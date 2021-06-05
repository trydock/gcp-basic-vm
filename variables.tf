# Variables

variable "gcp_cred_file" {
  description = "Name of GCP cred file"
  default     = null
}

variable "gcp_project_name" {
  description = "Name of GCP project"
  default     = null
}

variable "gcp_region" {
  description = "Specify a GCP region"
  default     = null
}

variable "gcp_subnetwork" {
  description = "Specify OS Image Family"
  default     = "default"
}

variable "gcp_instance_template_prefix" {
  description = "Prefix for GCP Instance Template"
  default     = null
}

variable "gcp_instance_template_machine_type" {
  description = "Specify GCP Instance Machine Type"
  default     = "f1-micro"
}

variable "gcp_instance_template_image_project" {
  description = "Specify OS Image Project"
  default     = "debian-cloud"
}

variable "gcp_instance_template_image_family" {
  description = "Specify OS Image Family"
  default     = "debian-10"
}

variable "nat_ip" {
  description = "Public ip address"
  default     = null
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

variable "service_account" {
  default = {
    email = "provisioner@project_name.iam.gserviceaccount.com"
    scopes = [
      "cloud-platform"
    ]
  }
  type = object({
    email  = string,
    scopes = set(string)
  })
  description = "Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account."
}
