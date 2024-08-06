# Задача 1

Найденные ошибки:
1. в main.tf - platform_id = "standart-v4". Во-первых ошибка в слове standard. Во-вторых v4 не бывает (см. [https://cloud.yandex.com/en/docs/compute/concepts/vm-platforms]). Возьмем standard-v1 - он дешевле.
2. в main.tf - cores = 1. Минимальное количество ядер - 2 ([https://cloud.yandex.com/en/docs/compute/concepts/performance-levels])


![VM terraform2](https://github.com/user-attachments/assets/cda8bc32-f31a-4ec6-9f9a-7263254f46dc)

![Снимок экрана от 2024-08-03 01-11-23](https://github.com/user-attachments/assets/9a73aa2b-89f9-4f55-94b4-cb709d08df39)



**Как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ?**

Мы делаем виртуальную машину прерываемой с гарантированной долей vcpu 5%, чтобы экономить грант, выделенный на обучение (так сильно дешевле)

# Задача 2

[main.tf с изменениями](task02/main.tf)

[variables.tf с изменениями](task02/variables.tf)

```
terraform plan
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enpq56ovs262i89ng0lo]
data.yandex_compute_image.ubuntu: Read complete after 1s [id=fd8500b61gv8mj86b0ns]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bk3uv3uhnkfq0v2r3m]
yandex_compute_instance.platform: Refreshing state... [id=fhmulannadpajrmhqkbk]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```


# Задача 3
[main.tf с изменениями](task03/main.tf)

[vms_platform](task03/vms_platform.tf)

```
terraform apply
data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd8hjvoj7ln4vjtiufn1]

Terraform used the selected providers to generate the following execution plan. Resource
actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_instance.platform will be created
  ...

Plan: 4 to add, 0 to change, 0 to destroy.
...

yandex_compute_instance.platform-db: Still creating... [1m0s elapsed]
yandex_compute_instance.platform-db: Creation complete after 1m8s [id=epd3l09698739hv8r8m3]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```

# Задача 4
[outputs.tf](task04/outputs.tf)

```
terraform output
vm_external_addresses = {
  "netology-develop-platform-db" = "84.201.141.92"
  "netology-develop-platform-web" = "84.201.142.89"
}
```

# Задача 5
[locals.tf](task05/locals.tf)

[main.tf с изменениями](task05/main.tf)

[variables.tf с изменениями](task05/variables.tf)

```
terraform apply
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp3o6ate3uc5baochip]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd8hjvoj7ln4vjtiufn1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bomjgjfvi7j4jbkhc1]
yandex_compute_instance.platform: Refreshing state... [id=epdnp7pbc8v5iouob7j1]
yandex_compute_instance.platform-db: Refreshing state... [id=epdb0najqj839rdf3npa]

yandex_compute_instance.platform: Creation complete after 31s [id=fhm7u4l57ij3amha7hh1]
yandex_compute_instance.platform-db: Still creating... [40s elapsed]
yandex_compute_instance.platform-db: Creation complete after 41s [id=fhm6ba7a98foo6qn7vn7]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```


# Задача 6
[vms_platform с изменениями](task06/vms_platform.tf)

[main.tf с изменениями](task06/main.tf)

[variables.tf с изменениями](task06/variables.tf)

```
terraform plan
data.yandex_compute_image.ubuntu: Reading...
yandex_vpc_network.develop: Refreshing state... [id=enp3o6ate3uc5baochip]
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd8hjvoj7ln4vjtiufn1]
yandex_vpc_subnet.develop: Refreshing state... [id=e9bomjgjfvi7j4jbkhc1]
yandex_compute_instance.platform: Refreshing state... [id=epdnp7pbc8v5iouob7j1]
yandex_compute_instance.platform-db: Refreshing state... [id=epdb0najqj839rdf3npa]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```

[Финальный код (вырезаны комменатрии)](final/)

# Задача 7

1. Напишите, какой командой можно отобразить второй элемент списка test_list.

```
> local.test_list[1]
"staging"
```

2. Найдите длину списка test_list с помощью функции length(<имя переменной>).

```
> length(local.test_list)
3
```

3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.

```
> local.test_map.admin
"John"
```

4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

```
> "${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

"John is admin for production server based on ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks"
```
