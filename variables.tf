# Variables

variable "gcp_cred_file" {
  description = "Name of GCP cred file"
  default     = null
}

variable "gcp_project_name" {
  description = "Name of GCP project"
  default     = null
}

variable "gcp_region {
  description = "Specify a GCP region"
  default     = null
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
