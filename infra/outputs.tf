output "vm_public_external_ip" {
  value       = try(google_compute_instance.vm_public.network_interface[0].access_config[0].nat_ip, null)
  description = "External IPv4 of vm-public."
}

output "vm_public_internal_ip" {
  value       = google_compute_instance.vm_public.network_interface[0].network_ip
  description = "Internal IP of vm-public."
}

output "vm_private_internal_ip" {
  value       = google_compute_instance.vm_private.network_interface[0].network_ip
  description = "Internal IP of vm-private."
}

