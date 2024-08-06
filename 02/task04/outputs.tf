output "vm_external_addresses" {
  value       = { 
    "${var.vm_web_platform_name}" = resource.yandex_compute_instance.platform.network_interface.0.nat_ip_address, 
    "${var.vm_db_platform_name}" = resource.yandex_compute_instance.platform-db.network_interface.0.nat_ip_address 
}
  description = "Extermal IPs of VMs."
}
