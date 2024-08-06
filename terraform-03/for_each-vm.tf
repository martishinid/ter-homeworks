#создаем main и replica
resource "yandex_compute_instance" "db" {
  for_each = {
    for index, vm in var.each_vm:
    index=> vm
  }

  name        = "db-${each.value.vm_name}"
  platform_id = "standard-v1"

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = each.value.disk
    }   
  }

  metadata = {
    ssh-keys  = "ubuntu:${local.rsa_pub}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  allow_stopping_for_update = true
} 