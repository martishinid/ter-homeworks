###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "compute image family"
}

variable "vm_web_platform_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "compute image platform name"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "compute image platform type"
}

variable "vm_web_resource" {
  type        = map
  default     = {
    cores         = 2
    memory        = 1
    core_fraction = 5
  } 
  description = "compute image vm resources"
}

variable "vm_web_is_preemptible" {
  type        = bool
  default     = true
  description = "compute image is preemptible"
}

variable "vm_web_uses_nat" {
  type        = bool
  default     = true
  description = "compute image uses nat"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh-keygen -t ed25519"
}
