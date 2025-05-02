---
title: "Desplegar en Heroku"
slug: "desplegar-en-heroku"
date: 2018-02-15T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Symfony]
---

# Desplegar en Heroku

Tras subir el proyecto a **Github**, podremos desplegarlo en Heroku de manera bastante sencilla.

1. Entramos a nuestra cuenta de Heroku y creamos una nueva aplicación.
2. Le damos un nombre y en la parte de desplegar __*deployment*__ lo conectamos con nuestra cuenta de Github.
3. Buscamos nuestro proyecto y lo seleccionamos.
4. A continuación, para evitarnos tener que desplegar cada versión a mano y dado que trabajaremos desde la rama develop en nuestro repositorio, marcamos la opción de __*Enable Automatic Deploys*__ haciendo que con cada push a master, se despliegue automáticamente.
5. En caso de que sea necesaria una base de datos, vamos a la pestaña __*Resources*__ luego en el apartado __*Add-ons*__ y pulsamos sobre __*Find more add-ons*__ donde veremos los distintos add-ons disponibles, entre ellos bases de datos como MongoDB y PostgreSQL.

