---
title: "Despliegue automático en Firebase hosting desde Github"
slug: "despliegue-automatico-en-firebase-hosting-desde-github"
date: 2018-08-11T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [firebase]
---

Despliegue automático en Firebase hosting desde Github
================================================================================

  Para desplegar automáticamente nuestra aplicación en el sistema de hosting de
  Firebase usaremos una herramienta  llamada [travis].

  Crear un fichero en la raiz de nuestro proyecto `.travis.yml` donde configurar
  todo lo referente al despliegue. En este primer ejemplo indicamos el lenguaje
  con el que trabajamos y su versión. Además, le indicamos que tiene que
  instalar las herramientas de firebase y que si todo sale bien lo despliegue
  con el token que le indicaremos a continuación. De momento no hacemos nada
  para decidir si debemos desplegar o no.

````````````````````````````````````````````````````````````````````````````````
language: node_js
node_js:
- "6.11.5"
sript:
- echo "Deploying!"
install:
- npm install -g firebase-tools
after_success:
- firebase deploy --token $FIREBASE_TOKEN
````````````````````````````````````````````````````````````````````````````````

Obtener token de firebase hosting
--------------------------------------------------------------------------------

  Para obtener este token ejecutamos `firebase login:ci`

  Con este token vamos a [travis], lo vinculamos con nuestra cuenta de
  [github], entramos en el proyecto que queremos hacer despliegue automatico y
  lo añadimos a los respositorios de travis.

  Ahora dentro de este proyecto en el apartado de __opciones >> ajustes__ y en
  la parte de abajo tenemos un apartado de __variables__. En él añadimos una
  variable con el nombre que puesto en el apartado `after_success`
  anteriormente, en nuestro caso `FIREBASE_TOKEN` como nombre y como valor
  ponemos el token que hemos obtenido al ejecutar `firebase login:ci`

- - -

  Ahora si nos dirigimos a nuestro proyecto en una ruta de este estilo
  `travis-ci.org/USUARIO/NOMBRE-PROYECTO` veremos como se ejecutan las
  instrucciones que hemos indicado en el fichero `.travis.yml`.

Configurar `.travis.yml`
--------------------------------------------------------------------------------

  Ahora mismo este fichero no tiene gran cosa, solo instala las herramientas de
  firebase y muestra un mensaje por consola. Tendremos que sustituir el mensaje
  por consola por las instrucciones que nos hagan falta, en mi caso ha quedado
  de la siguiente forma.

````````````````````````````````````````````````````````````````````````````````
language: node_js
node_js:
  - "6.11.5"
sript:
  - yarn install
install:
  - yarn add pug
  - yarn global add firebase-tools
  - yarn add -D jest
  - yarn add -D babel-plugin-transform-es2015-modules-commonjs
  - yarn install
after_success:
  - firebase deploy --token $FIREBASE_TOKEN
````````````````````````````````````````````````````````````````````````````````

  En la parte de instalación le he añadido todas las dependencias de mi
  proyecto, `pug`, `firebase-tools`, `jest`,
  `babel-plugin-transform-es2015-modules-commonjs` y después de todo esto le he
  indicado que tiene que instalarlas.

  Llegados a este punto es importante que tengas un `script` `test` dentro de tu
  `package.json`. Porque este es el que se ejecutará al final de todo el proceso
  de instalación y, dependiendo del resultado el sistema lo considerará success
  o no. En mi caso el script que tengo es de la siguiente forma.

````````````````````````````````````````````````````````````````````````````````
"scripts": {
"test": "yarn jest",
[...]
````````````````````````````````````````````````````````````````````````````````

  Al tener todo esto configurado cuando hagamos un nuevo push a nuestro
  respositorio [travis] lo detectará y ejecutará nuestro script, si todo sale
  bien desplegará nuestra nueva versión. Además nos mantendrá informado de el
  estado de la aplicación.

Referencias
--------------------------------------------------------------------------------

* [Articulo original][articulo-original]
* Toda la información referente a firebase [aquí][firebase]
* Documentación oficial de Travis [aquí][travis]
* Este proyecto se encuentra en [Github][github]

<!-- All links here -->

[articulo-original]: https://medium.com/@cpavnn/deploy-to-firebase-hosting-from-github-3772fed05e72
[firebase]: https://firebase.google.com/
[travis]: https://travis-ci.org/
[github]: https://github.com/CrisKrus/juego-saber
[firebase functions]: https://firebase.google.com/docs/functions/?hl=es-419

