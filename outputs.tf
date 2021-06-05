# Outputs

output "self_link" {
  description = "Self-link to the instance template"
  value       = module.vm_instance_template.self_link
}

output "name" {
  description = "Name of the instance templates"
  value       = module.vm_instance_template.name
}

output "instances_self_links" {
  description = "List of self-links for compute instances"
  value       = module.vm_compute_instance.instances_self_links
}

output "available_zones" {
  description = "List of available zones in region"
  value       = module.vm_compute_instance.available_zones
}
