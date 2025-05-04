---
title: "Optimización de imágenes"
slug: "docker/optimizacion-de-imagenes"
date: 2021-02-15T00:00:04.000Z
draft: false
hideLastModified: false
summary: ""
categories: [docker]
summaryImage: "summary.png"
---

En este artículo veremos un comportamiento importante a la hora de crear nuestras imágenes.

## Organización en capas

Como veremos más adelante en nuestros *Dockerfile* cuando configuramos nuestra imagen ejecutamos ciertos comandos y cada comando `RUN`, `COPY` o `ADD` es considerado una capa. Con cada nueva instrucción de este conjunto mencionado tenemos una nueva capa que se pone sobre la anterior. Cuando nosotros creamos una imagen basada en `Node`, por ejemplo, esta imagen que creamos está basada en la capa de node que viene de [DockerHub](https://hub.docker.com/) de node. Y, sobre de ella, nosotros decidimos que más ponerle. Como puede ser nuestros ficheros fuentes, instalar nuestras dependencias, etc.

Lo bueno de que funcione de esta forma es que la primera vez que creamos la imagen tardará un poco en instalar todas las dependencias de nuestro proyecto y ejecutar todos los comandos que le hemos indicado. Pero, una vez esto por primera vez, Docker guarda en caché las capas y automáticamente comprobará que si la capa que vamos a crear es la misma que ya teníamos antes y la estamos creando sobre la misma que estaba antes el resultado será el mismo de siempre. Y Docker usará la misma que tiene guardada ahorrando tiempo en la creación de la nueva imagen.

## Imagen 1

Como vimos en [como crear mi primer contenedor](https://criskrus.com/2021/02/cómo-crear-mi-primer-contenedor/) podemos partir de una imagen creada de la siguiente forma.

```docker
# Dockerfile
FROM node

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 3000

CMD node index.js
```

El problema que presenta esta primera versión es que dado el funcionamiento en capas con el que trabaja Docker esta imagen cada vez que hagamos un cambio en el código fuente instalará de nuevo todas las dependencias del proyecto. Dado que las dependencias no es algo que cambie con frecuencia nos interesa que al construir la imagen estas capas se usen desde el caché. Para ello podemos hacer la siguiente modificación.

```docker
FROM node

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY ./src ./src

CMD node index.js

```

De esta forma la primera mitad del fichero `Dockerfile` hasta `RUN npm install` será usado desde caché, ya que no cambia cuando hacemos nuevos desarrollos en nuestra aplicación. Como puede ser: añadir un nuevo *endpoint.*

## Agrupar capas

Otra opción muy común cuando trabajamos con imágenes que parten de un sistema linux, por ejemplo, y queremos instalar ciertas dependencias es agrupar en una misma capa toda la instalación de paquetes. Esta idea está dentro de la documentación de [buenas prácticas](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers)

```docker
FROM ubuntu

RUN apt-get update && apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  node

WORKDIR /app
COPY ./src ./src

CMD node index.js
```

## *Multi stage building*

Otra opción común si queremos evitar tener dependencias en el despliegue las cuales son necesarias en la construcción de nuestra aplicación podemos usar *multi stage build* (construcción de imágenes multi-estado)

Esta técnica también se encuentra dentro del manual de [buenas prácticas](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#use-multi-stage-builds) de Docker. Con ella podemos crear varias imágenes en un solo fichero `Dockerfile` las cuales construyen parte de nuestra aplicación y copiar en la imagen final solamente los ficheros que necesitamos para funcionar.

En este caso partimos de una imagen de node a la que le damos el nombre de `builder`, instalamos las dependencias y construimos la aplicación. Esta aplicación queda guardada en el directorio `/build` dentro de la primera imagen. A continuación, creamos una nueva imagen y copiamos solo la parte que hemos construido necesaria para que nuestra app funcione al público y la arrancamos.

```docker
FROM node:10-alpine as builder

WORKDIR /app

COPY ./package.json ./package.json

RUN npm install

COPY ./src /app/src

RUN npm run build

FROM node:10-alpine

WORKDIR /app

COPY --from=builder /app/build/index.js ./index.js
COPY --from=builder /app/node_modules ./node_modules/

EXPOSE 8080

CMD node ./index.js
```

Con esta forma de construir imágenes docker nos ahorramos en la imagen final todos los datos y ficheros necesarios en la parte de construcción. Esto hace que la imagen final sea menos pesada al tener menos información.
