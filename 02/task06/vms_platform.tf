# Общие переменные для всех VM
variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "compute image family"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "compute image platform type"
}

variable "vm_is_preemptible" {
  type        = bool
  default     = true
  description = "compute image is preemptible"
}

variable "vm_uses_nat" {
  type        = bool
  default     = true
  description = "compute image uses nat"
}

variable "vms_resources" {
  type        = map
  default     = {
    web = {
        cores         = 2
        memory        = 1
        core_fraction = 5
    },
    db = {
        cores         = 2
        memory        = 2
        core_fraction = 20
    }
  }
  description = "compute image vm resources"
}

variable "metadata" {
  type        = map
  default     = {
    serial-port-enable = 1
    ssh-keys  = ""
  }
  description = "vm metadata"
}


# Параметры для netology-develop-platform-web
/*variable "vm_web_platform_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "compute image platform name"
}

variable "vm_web_resource" {
  type        = map
  default     = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  } 
  description = "compute image vm resources"
}*/

# Параметры для netology-develop-platform-db
/*variable "vm_db_platform_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "compute image platform name"
}

variable "vm_db_resource" {
  type        = map
  default     = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  } 
  description = "compute image vm resources"
}*/