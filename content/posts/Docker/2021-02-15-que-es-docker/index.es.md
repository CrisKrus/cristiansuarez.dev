---
title: "¿Qué es Docker?"
slug: "docker/que-es-docker"
date: 2021-02-15T00:00:00.000Z
draft: false
hideLastModified: false
summaryImage: "summary.png"
summary: ""
categories: [docker]
tags: [docker, devops]
---

Docker es la forma de tener una misma configuración de un proyecto independientemente de la máquina o el sistema en el que te encuentres, siempre que tenga Docker instalado. Facilitando así los despliegues y desarrollos de aplicaciones.

Además de esto con Docker podrás trabajar y jugar con distintas herramientas y tecnologías sin llenar de paquetes que no te interesan en tu máquina.

Quiero dejar claro que Docker no es una máquina virtual, aunque de primeras puede parecerse bastante cuando veamos como funciona realmente comprobaremos que no se parece en nada. De primeras puedes pensarlo de esta forma, te hará más fácil entender el resto de conceptos, pero quiero dejar claro que **no es una máquina virtual**

Como podemos ver en la imagen siguiente una máquina virtual necesita tener un sistema operativo desde cero sobre el de nuestra máquina *host*. Y luego, encima de este nuevo sistema tendremos las librerías necesarias y las aplicaciones que queremos probar.

En cambio, Docker comparte el mismo núcleo del sistema y aislar las librerías que queremos usar dentro del contenedor. Es decir, en el fondo, Docker se está ejecutando en tu máquina, no en un sistema nuevo, pero aislar todos estos procesos y paquetes en una zona privada a la que nadie puede acceder (contenedor). Explicaré en otro post con más detalle.

![https://i.imgur.com/3eoPoqH.png](https://i.imgur.com/3eoPoqH.png)
