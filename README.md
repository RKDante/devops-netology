З# Домашнее задание "Применение принципов IaaC в работе с виртуальными машинами"
## Задача 1

1.)	Опишите своими словами основные преимущества применения на практике IaaC паттернов.
- Скорость развертывания.
- Выявление проблем в конфигурации обеспечивает быстрое восстановление после сбоев.
- Минимальная уязвимость инфраструктуры из-за одинакового развёртывания ресурсов
- 

2.)	Какой из принципов IaaC является основополагающим?
- Автоматизация инфраструктуры, она минимизирует риск возникновения ошибок.
- Основополагающим принципом IaaC является идемпотентность, если её многократное выполнение приводит к тому же результату, что и однократное выполнение.

## Задача 2
1.)	Чем Ansible выгодно отличается от других систем управление конфигурациями?
- Ansible – интерпретатор который поддерживается в большинстве дистрибутивов linux, написанный на Python, использует метод push, что не требует установки агентов. Ansible использует существующую инфраструктуру SSH, в то время как другие (chef, puppet, и пр.) требуют установки специального PKI-окружения

2.)  Какой, на ваш взгляд, метод работы систем конфигурации более надёжный push или pull?
- Push подходит для управления малого количества машин.
- Pull лучше подходит для управления большим количеством машин, необходимы системы с агентами. Небольшое потребление мощностей для машины управления. Большое время подготовки машин, и увеличенный расход ресурсов.  

## Задача 3
1.) Установить на личный компьютер:
 (Приложить вывод команд установленных версий каждой из программ, оформленный в markdown.)
- VirtualBox
```sh
virtualbox -h
Oracle VM VirtualBox VM Selector v7.0.12
Copyright (C) 2005-2023 Oracle and/or its affiliates
```
- Vagrant
```sh
vagrant --version
Vagrant 2.3.7
```
- Terraform
```sh
Terraform v1.6.6
on linux_amd64
```
- Ansible
```sh
ansible [core 2.15.8]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.0.3
  libyaml = True
```

## Задача 4
1.)  Воспроизвести практическую часть лекции самостоятельно.
- Создать виртуальную машину.
[Скриншот]()
- Зайти внутрь ВМ, убедиться, что Docker установлен с помощью команды
docker ps
[Скриншот]()