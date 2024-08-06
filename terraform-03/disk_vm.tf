resource "yandex_compute_disk" "test_disk" {
  count    = 3

  name     = "disk-${count.index}"
  type     = "network-ssd"
  zone     = var.default_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size     = 5

  labels = {
    environment = "test"
  }
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = 5
    }   
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.test_disk
    content {
      disk_id     = secondary_disk.value.id
    }
  }

  metadata = {
    ssh-keys  = "ubuntu:${local.rsa_pub}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  allow_stopping_for_update = true
}