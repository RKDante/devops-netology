## Домашнее задание к занятию "3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

Задача 1

Сценарий выполения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберете любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность: запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>

Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

```
root@dante-virtual-machine:/home/dante# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                               NAMES
070a602c0353   nginx     "/docker-entrypoint.…"   8 seconds ago   Up 8 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   nginxdev1


root@dante-virtual-machine:/home/dante# curl localhost
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>

```
Ответ: https://hub.docker.com/repository/docker/krivovdevops/devops1/general 

## Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

- Высоконагруженное монолитное java веб-приложение;
```
Желательно на Физический сервер, т.к. приложение монолитное, сложно разбить на микросервисы.
Необходим прямой доступ к ресурсам. 
```
- Nodejs веб-приложение;
```
Подойдет Docker, так как это веб-платформа с подключаемыми внешними библиотеками, снижает трудозатраты на деплой приложения и организацию.
```
- Мобильное приложение c версиями для Android и iOS;
```
Необходим GUI, подойдет виртуализация.
```
- Шина данных на базе Apache Kafka;
```
Я считаю что лучше подойдёт VM., если полнота данных критична.
```
- Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды - elasticsearch, два logstash и две ноды kibana;
```
Elasticsearvh лучше на VM, отказоустойчивость решается на уровне кластера, kibana и logstash можно вынести в Docker.
```
- Мониторинг-стек на базе Prometheus и Grafana;
```
Подойдет Docker, легко масштабировать, данные не хранятся.
```
MongoDB, как основное хранилище данных для java-приложения;
```
Зависит от нагрузки на DB. Если нагрузка большая, то физический сервер, если нет – VM.
```
- Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.
```
Подойдет VM для DB и фалового хранилища, Docker для сервисов
```
  
## Задача 3

- Запустите первый контейнер из образа centos c любым тэгом в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
``` 
root@dante-virtual-machine:/home/dante# docker run -it -d --name centos -v $(pwd)/data:/data centos:latest
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
a1d0c7532777: Pull complete 
Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
Status: Downloaded newer image for centos:latest
21fcc6be589433db509a66146827b4315dab259361f8aa9271d800781fca4451
```
- Запустите второй контейнер из образа debian в фоновом режиме, подключив папку /data из текущей рабочей директории на хостовой машине в /data контейнера;
```
root@dante-virtual-machine:/home/dante# docker run -it -d --name debian -v $(pwd)/data:/data debian:latest
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
1b13d4e1a46e: Pull complete 
Digest: sha256:b16cef8cbcb20935c0f052e37fc3d38dc92bfec0bcfb894c328547f81e932d67
Status: Downloaded newer image for debian:latest
331b56d3d720605800cdf6482ef5c235668a1b6eaf943a035c328ff7c6fa2e8d
```
- Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data;
```
root@dante-virtual-machine:/home/dante# docker exec -it centos bash
[root@21fcc6be5894 /]# cd /data
[root@21fcc6be5894 data]# touch file.txt
[root@21fcc6be5894 data]# vi file.txt 
[root@21fcc6be5894 data]# exit
exit
```
- Добавьте еще один файл в папку /data на хостовой машине;
```
root@dante-virtual-machine:/home/dante# echo "New file-2" >> data/file.txt
```
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.
```
root@dante-virtual-machine:/home/dante# echo "New file-2" >> data/file.txt
root@dante-virtual-machine:/home/dante# docker exec -it debian bash
root@331b56d3d720:/# ls data/
file.txt
```
  