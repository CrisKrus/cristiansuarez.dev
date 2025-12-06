---
title: "Conceptos básicos de la toma de requisitos"
slug: "toma-de-requisitos/conceptos-basicos-de-la-toma-de-requisitos"
date: 2021-02-15T00:00:01.000Z
draft: false
hideLastModified: false
summaryImage: "summary.png"
summary: ""
categories: [toma de requisitos]
tags: [análisis, conceptos-básicos, requisitos, fundamentos]
---

Antes de empezar necesitamos tener una serie de conceptos claros que nombraremos bastante a menudo. Estos son **imagen**, **contenedor** y **volumen**. Estas palabras las usaremos con frecuencia, ya que son la base de Docker.

## Imagen

Una **imagen** es una configuración para un contenedor, podemos hacer el símil cuando creamos una clase para instanciar un objeto en programación. Creamos un molde con cierta configuración y funciones en su interior que podemos instanciar (crear) tantas veces como queramos en varios objetos y siempre será de la misma forma.

Una imagen de Docker sería nuestra clase en programación. Para configurar esta imagen como si de un fichero de programación se tratase Docker dispone de los **Dockerfile**, los cuales explicaremos más adelante. En ellos pondremos todos los datos que necesitamos para que funcione correctamente como las variables de entorno, comandos que ejecuta, etc.

## Contenedor

Siguiendo con el símil anterior de la clase de programación y el objeto, un **contenedor** sería una instancia de la clase que hemos creado. Es decir, creamos una instancia que tiene toda la configuración que y funciones que le hemos indicado. Podremos crear tantas como queramos.

Con esta clase ya definida da igual en que parte de nuestra aplicación la usemos siempre partirá de la misma base. De forma que siempre podremos trabajar con ella partiendo del mismo punto.

Podemos crear tantos contenedores como nos sea necesario gestionándolos a nuestro gusto. Con esto quiero decir que un contenedor lo podemos crear, eliminar, parar, volver a arrancarlo, conectarnos a él, dejarlo en segundo plano, exponer los puertos que nos interesen, etc. Iremos viendo como hacer cuando llegue el momento.

## Volumen

Además, cada contenedor tiene asociado con él un **volumen**. Los volúmenes son donde cada contenedor guarda la información que tiene en su interior como si de un "disco duro" propio se tratase.

Estos volúmenes se encuentran en nuestro sistema y no dejan de ser carpetas que podemos ver. Este punto es importante tenerlo claro porque puede parecer "magia" cómo y dónde guarda la información los contenedores, ya que no está a simple vista en el sistema y solo la vemos dentro del propio contenedor.

Y digo que es importante tenerlo en cuenta porque es normal en algún momento hacerse la pregunta: ¿Se pierde la información cuando apago el contenedor?

La respuesta corta es no, la información no se pierde, como he dicho está en nuestro sistema en algún punto. La respuesta larga es que si paramos un contenedor la siguiente vez que lo arranquemos seguirá con todos los mismos datos en su interior tal cual lo habíamos dejado.

Dado que como cada una de estas tres partes (imagen, contenedor, volumen) son **independientes** entre sí, una vez eliminamos un contenedor el volumen sigue existiendo en nuestro sistema, durante un tiempo.
