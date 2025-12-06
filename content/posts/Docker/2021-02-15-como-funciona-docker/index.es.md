---
title: "¿Cómo funciona Docker?"
slug: "docker/como-funciona-docker"
date: 2021-02-15T00:00:02.000Z
draft: false
hideLastModified: false
summaryImage: "summary.png"
summary: ""
categories: [docker]
tags: [arquitectura, docker, devops, conceptos]
---

Para comenzar basta con instalar Docker en nuestra máquina. Dependiendo de nuestro sistema operativo tendremos que seguir unos pasos u otros. La [documentación oficial de Docker](https://docs.docker.com/install/#supported-platforms) es muy buena y nos hará de guía en este proceso.

El caso de Windows es un poco especial, tienes que tener en cuenta que no puedes al mismo tiempo usar las máquinas virtuales y Docker porque da problemas con el Hyper-V. No estoy al día con este tema, uso Ubuntu, pero he escuchado hablar mucho sobre este problema a mis compañeros. Existen otra casuística dónde Docker no puede acceder al disco duro de la máquina y tienes que ir a la configuración de *Docker Desktop* para compartir el disco duro de la máquina.

Una vez instalado nos basta con abrir nuestra terminal y ejecutar este comando `docker run -it ubuntu`. Cuando se ejecute esta instrucción estaremos dentro de una terminal nativa de ubuntu y tendremos una máquina linux lista para trabajar desde la consola sin problemas.

Dentro de esta consola podremos ejecutar comandos como `apt update` `apt install wget` o lo que queramos. Todo lo que hagamos se mantendrá dentro de nuestro contenedor. Cuando queramos salir tendremos que ejecutar `exit` y volveremos a estar en nuestra máquina *host*.

Y te preguntarás <<*¿cómo es todo esto posible? ¿Cómo puedo tan rápidamente trabajar con una máquina linux sin miedos a contaminar mi máquina local?*>> Todo esto es posible gracias a los *[namespaces](https://en.wikipedia.org/wiki/Linux_namespaces)* y los *[cgroups](https://en.wikipedia.org/wiki/Cgroups)*. Con estas dos tecnologías podemos lograr que los contenedores consuman tantos recursos como nosotros le digamos (*[cgroups](https://en.wikipedia.org/wiki/Cgroups)*) y vean tanto como les correspondan (*[namespaces](https://en.wikipedia.org/wiki/Linux_namespaces)*).

Estas tecnologías no son para nada nuevas han existido en los sistemas *unix* desde hace años. En el caso de los *[namespaces](https://en.wikipedia.org/wiki/Linux_namespaces)* desde el 2002 y los *[cgroups](https://en.wikipedia.org/wiki/Cgroups)* en el año 2007 fue su primera versión estable. Con esto quiero decir, que es una tecnología estable de la cual podemos confiar el correcto funcionamiento, no es la última moda que han sacado y están en su primera versión prematura.

### Comprobar que no es una máquina virtual

Para ver que realmente estos procesos que ejecutamos dentro de nuestro contenedor están en nuestra máquina *host* podemos hacer un `sleep` en nuestro Docker de Ubuntu y, comprobar como se está ejecutando en nuestra máquina local. Para ello iniciamos en un terminal un contenedor de Ubuntu y dentro de él ejecutas `sleep` de 30 segundos, esto congelará la terminal durante 30 segundos.

```
docker run -it --rm ubuntu
sleep 30

```

Mientras este `sleep` siga en funcionamiento, en otra terminal en nuestro equipo donde hemos arrancado el contenedor hacemos lo siguiente `ps -ejH` y buscamos entre toda la salida que obtenemos el proceso del contenedor que debe de estar como proceso hijo de docker. El resultado debe ser algo similar a lo siguiente.

```
ps -ejH

# [...]
 3358  3358  3358 ?        00:00:09   dockerd
 3793  3793  3793 ?        00:00:14     docker-containe
 9967  9967  3793 ?        00:00:00       docker-containe
 9991  9991  9991 pts/0    00:00:00         bash
10776 10776  9991 pts/0    00:00:00           sleep
# [...]

```

Como hemos podido ver los comandos del contenedor están siendo ejecutados en nuestra máquina pero con la ayuda de los *[namespaces](https://en.wikipedia.org/wiki/Linux_namespaces)* docker no nos da visión de los mismos y desde dentro del contenedor no podemos ver nada de lo que ocurre en la máquina host.
