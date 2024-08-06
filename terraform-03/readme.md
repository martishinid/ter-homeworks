# Задача 1
![Alt text](/images/task-1-1.png)
![Alt text](/images/task-1-2.png)



# Задача 2
![4 созданные машины](https://github.com/user-attachments/assets/01d905e9-13e5-41ea-8913-9ed57d6720b0)
![группа безопасности](https://github.com/user-attachments/assets/76a29d51-f449-400a-ac4e-012e0a9baa79)
Группа безопасности применена.

[count-vm.tf](count-vm.tf)

[for_each-vm.tf](for_each-vm.tf)

# Задача 3
Диски размером меньше 1 ГБ не дает создать, только от 5 Гб.

[disk_vm.tf ](disk_vm.tf)
```
yandex_compute_disk.test_disk[2]: Creating...
yandex_compute_disk.test_disk[1]: Creating...
yandex_compute_disk.test_disk[0]: Creating...
yandex_compute_disk.test_disk[1]: Still creating... [10s elapsed]
yandex_compute_disk.test_disk[0]: Still creating... [10s elapsed]
yandex_compute_disk.test_disk[2]: Still creating... [10s elapsed]
yandex_compute_disk.test_disk[0]: Creation complete after 15s [id=fhmq5ndkvs3011i2gr0v]
yandex_compute_disk.test_disk[2]: Creation complete after 19s [id=fhml3p4ku6r4p37bdp4v]
yandex_compute_disk.test_disk[1]: Still creating... [20s elapsed]
yandex_compute_disk.test_disk[1]: Creation complete after 20s [id=fhm1al4p82paekhf8710]
yandex_compute_instance.storage: Creating...
yandex_compute_instance.storage: Still creating... [10s elapsed]
yandex_compute_instance.storage: Still creating... [20s elapsed]
yandex_compute_instance.storage: Still creating... [30s elapsed]
yandex_compute_instance.storage: Creation complete after 35s [id=fhm3454shiq4stg4rsdk]
Apply complete! Resources: 4 added, 0 changed, 0 destroyed.
```
# Задача 4
```
[webservers]
web-1   ansible_host=89.169.136.80  fqdn=fhm0sunlkb6ei4rpbaos.auto.internal
web-2   ansible_host=89.169.146.20  fqdn=fhm3gbhakscukd5akl1g.auto.internal
            
[databases]
db-main   ansible_host=89.169.141.28 fqdn=fhmstou6ho8755ljokf2.auto.internal
db-replica   ansible_host=89.169.142.138 fqdn=fhmh8rdn64ep45us3731.auto.internal
            
[storage]
storage   ansible_host=51.250.8.207  fqdn=fhm3454shiq4stg4rsdk.auto.internal
```
[ansible.tf](ansible.tf)
[hosts.tftpl](hosts.tftpl)
