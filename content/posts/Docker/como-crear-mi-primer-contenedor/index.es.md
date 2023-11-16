---
title: "¿Cómo crear mi primer contenedor?"
date: 2021-02-15T00:00:03.000Z
draft: false
hideLastModified: false
summary: ""
categories: [docker]
summaryImage: "summary.png"
---

Ahora vamos a ver como crear nuestro primer contenedor, para ello primero debemos crear una imagen de la que partir, para esto crearemos un fichero de configuración Docker. Este fichero se llama `Dockerfile`, en él se indican todas las instrucciones que tiene que seguir para crear la imagen y su contenido.

## Proyecto de ejemplo

Para este ejemplo vamos a crear una imagen de Docker que contenga un servidor en Node con un endpoint que nos devuelva un texto.

Para ello vamos a crear primero un directorio donde guardar todo el contenido del proyecto y dentro de este directorio de proyecto crearemos nuestro *EndPoint* de nuestro servidor.

```jsx
// index.js
const http = require('http');

let app = http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/plain'});
		console.log('Hello world log!');

    res.end('Hello World!\\n');
});

app.listen(3000, '127.0.0.1');
console.log('Node server running on port 3000');

```

Una vez tenemos nuestro servidor con el que crearemos la imagen vamos a escribir nuestro fichero de configuración `Dockerfile`

```docker
# Dockerfile
FROM node

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 3000

CMD node index.js
```

En este caso partimos ya de una imagen existente de Node y simplemente creamos un directorio de trabajo, copiamos nuestros ficheros dentro y ejecutamos ciertos comandos para instalar las dependencias y arrancar la app.

Una vez tenemos los ficheros creados nos bastaría con ejecutar desde la consola `docker build -t node:leanmind .` en el mismo directorio dónde se encuentra todo nuestro proyecto.

Con este comando le estamos diciendo a Docker lo siguiente:

- que nos construya una imagen `build`
- con el *tag* (etiqueta) leanmind `-t node:leanmind`. Este punto es importante si queremos diferenciarla de otras imágenes que no queremos sobrescribir
- en el directorio actual `.`. En este directorio es donde buscará el fichero Dockerfile

Para comprobar si la imagen se ha creado correctamente ejecutamos `docker images` en la consola nos debe devolver algo similar a esto

```bash
@criskrus:~/WorkSpace/node-example$ docker images
REPOSITORY      TAG                IMAGE ID         CREATED            SIZE
node            node:leanmind      8dd8c5d26f3d     Few seconds ago    125MB
```

## Etiquetas de las imágenes

Cuando creamos una imagen Docker podemos ponerle un *tag* o etiqueta. Lo que se suele hacer es dar un nombre a las etiquetas y una versión en las que nos encontramos, por ejemplo `FROM node:12`. Estas etiquetas las podemos ver en [DockerHub](https://hub.docker.com/_/node?tab=tags&page=1&name=12) en el apartado de *tags.* Para evitar colisiones con imágenes que ya existen y no queremos sobrescribir podemos organizar las imágenes que creamos bajo una ruta personalizada. Para ello basta con crear la imagen bajo una ruta `docker build -t criskrus/node .` De esta forma podemos tener en nuestra máquina descargada la imagen de node proveniente de [DockerHub](https://hub.docker.com/_/node?tab=tags&page=1&name=12) y nuestra versión personalizada con
un nombre similar.

## Arrancar la imagen

Con la imagen ya creada en el paso anterior arrancamos el contenedor basado en esa imagen con `docker run --rm -P node:leanmind`

Esto nos deja la consola ocupada con los logs del servidor node que hemos arrancado. Para ver que hemos creado la imagen y arrancado bien el contenedor podemos ir a nuestro explorador web y visitar `localhost:3000`

## Instrucciones del Dockerfile

Como hemos en el Dockerfile aparecen ciertas palabras clave, le daremos el nombre de **instrucciones**, con las que hemos modificado el estado inicial de la imagen.

La primera de todas `FROM` esta instrucción siempre es necesaria. Toda imagen de Docker parte de una base, bien puede ser una ya creada con cierto conjunto de herramientas como es nuestro caso `FROM node` o bien desde una imagen vacía `FROM alphine`. El fichero de `Dockerfile` pueden tener varias instrucciones las cuales están bien explicadas en la [documentación oficial](https://docs.docker.com/engine/reference/builder/#from)

Dentro de las opciones de instrucciones disponibles en un `Dockerfile` se encuentran `CMD` y `ENTRYPOINT` quiero dedicarles un apartado especial porque fueron las dos que más me han costado aprender. Inicialmente me parecían lo mismo, pero no son para nada iguales.

- `ENTRYPOINT` es lo que se ejecutará al finalizar la construcción del contenedor
    - El por defecto es `/bin/sh`
- `CMD` son los argumentos que recibe por defecto el comando del `ENTRYPOINT`

```docker
FROM debian

ENTRYPOINT ["/bin/ping"]

CMD ["localhost"]
```
