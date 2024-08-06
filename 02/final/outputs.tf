output "vm_external_addresses" {
  value       = { 
    "${local.vm_web_name}" = resource.yandex_compute_instance.platform.network_interface.0.nat_ip_address, 
    "${local.vm_db_name}" = resource.yandex_compute_instance.platform-db.network_interface.0.nat_ip_address 
}
  description = "Extermal IPs of VMs."
}
