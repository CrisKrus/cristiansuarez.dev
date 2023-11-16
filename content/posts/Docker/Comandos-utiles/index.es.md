---
title: "Comandos útiles"
date: 2021-02-15T00:00:07.000Z
draft: false
hideLastModified: false
categories: [docker]
summaryImage: "summary.png"
---

En el CLI de docker existen muchas opciones, aquí te dejo las que más suelo usar explicadas.

## `docker container run`

- `-d IMAGE` segundo plano
- `-i IMAGE` mantiene el input abierto (interactivo)
- `-t IMAGE` asigna un pseudo terminal. Estas dos últimas las suelo usar juntas casi siempre `-it` de esta forma (si la imagen lo permite) al arrancar se me queda una terminal abierta esperando ser usada desde dentro del contenedor.
- `-p 8000:5000 IMAGE` mapear el puerto para poder acceder. El 8000 mi máquina se asigna al 5000 del contenedor
- `--rm IMAGE` elimina el contenedor al pararlo
- `-e MY_VARIABLE=foo IMAGE` al crear el contenedor establece la variable de entorno `MY_VARIABLE` con el valor `foo`

## `docker container`

- `ls -a` muestra todos los contenedores equivalente a `docker ps -a`
- `ls -q` lista los contenedores arrancados y solo muestra los ID equivalente a `docker ps -q`
- `exec CONTAINER COMMAND`, ejecuta dentro del contenedor en comando. Uno bastante sencillo sería `docker exec -it ubuntu bash`
- `inspect CONTAINER`, muestra las propiedades el contenedor

## Limpiar Docker

Este apartado lo considero bastante importante porque de primeras puede parecer que Docker no genera archivos pero después de un tiempo trabajando con él puedes tener en tu disco duro varios GB de volúmenes sin usar. Conviene limpiar de vez en cuando.

- `docker container prune` elimina todos los contenedores parados
- `docker container rm CONTAINER` elimina el contenedor
- `docker container rm -v CONTAINER` elimina el contenedor y el volumen asociado
- `docker system prune --volumes` elimina todas las imágenes, contenedores y sus volúmenes asociados.
