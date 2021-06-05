provider "google" {
  credentials = file(var.gcp_cred_file)
  project     = var.gcp_project
  region      = var.gcp_region
}

module "vm_instance_template" {
  source               = "terraform-google-modules/vm/google//modules/instance_template"
  version              = "6.4.0"
  name_prefix          = var.gcp_instance_template_prefix
  machine_type         = var.gcp_instance_template_machine_type
  region               = var.gcp_region
  source_image_project = var.gcp_instance_template_image_project
  source_image_family  = var.gcp_instance_template_image_family
  subnetwork           = var.gcp_subnetwork
  service_account      = var.service_account
  metadata = {
    ssh-keys = "anish:${file("~/.ssh/id_rsa.pub")}"
  }
}

module "vm_compute_instance" {
  source            = "terraform-google-modules/vm/google//modules/compute_instance"
  version           = "6.4.0"
  instance_template = module.vm_instance_template.self_link
  subnetwork        = var.gcp_subnetwork
  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }]
}
