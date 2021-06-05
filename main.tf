provider "google" {
  credentials = file(var.gcp_cred_file)
  project     = var.gcp_project
  region      = var.gcp_region
}

module "vm_instance_template" {
  source               = "terraform-google-modules/vm/google//modules/instance_template"
  version              = "6.4.0"
  name_prefix          = "instance-template-"
  machine_type         = "f1-micro"
  region               = "asia-southeast1"
  source_image_project = "debian-cloud"
  source_image_family  = "debian-10"
  subnetwork           = "default"
  service_account      = var.service_account
  metadata = {
    ssh-keys = "anish:${file("~/.ssh/id_rsa.pub")}"
  }
}

module "vm_compute_instance" {
  source            = "terraform-google-modules/vm/google//modules/compute_instance"
  version           = "6.4.0"
  instance_template = module.vm_instance_template.self_link
  subnetwork        = "default"
  access_config = [{
    nat_ip       = var.nat_ip
    network_tier = var.network_tier
  }]
}
