---
title: "Node.js apps en Firebase"
slug: "firebase/node-js-apps-en-firebase"
date: 2018-08-04T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [firebase]
tags: [firebase, hosting, serverless, backend, functions, deploy]
---


  Si queremos podemos montar nuestra aplicación Node.js en *firebase hosting*
  usando *firebase functions* de manera gratuita y sin muchos problemas. A
  continuación muestro como inicial el proyecto.

Instalación y configuración
--------------------------------------------------------------------------------

  Primer paso instalar `firebase-tools` en caso de no tenerlo instalado.
  Basta con ejecutar:

  `npm install -g firebase-tools`

  A continuación dentro de nuestro directorio donde usaremos para la aplicación
  iniciamos un hosting con firebase:

  `firebase init hosting`

  Durante la configuración nos hará varias preguntas, donde se alojará la parte
  pública de la aplicación y si esta será [SPA] o no, decidiremos en nuestro
  caso concreto y continuamos.

  Seguimos iniciando el módulo de funciones.

  `firebase init functions`

  De igual manera que en el caso anterior preguntará que queremos usar, lo
  cofiguramos a nuestro gusto sin mayor problema y seguimos.

  En nuestro caso como usaremos `express` vamos dentro del directorio
  `functions` y le indicamos esta dependencia

  `npm i express --save`

Primera función
--------------------------------------------------------------------------------

  Ahora abrimos nuestro proyecto con nuestro editor, vamos al fichero
  `/functions/index.js` y descomentamos las líneas que vienen por defecto
  quedando tal que así.

```javaScript
const functions = require('firebase-functions');

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.helloWorld = functions.https.onRequest((request, response) => {
  response.send("Hello from Firebase!");
});
```

  Desde este fichero podemos crear nuestra primera función, en este caso
  haremos una ruta en  la que nos mostrará el el resultado de la función
  `Date.now()`. Para ello tendremos que importar `express` y crear nuestro
  objeto `app`. Además cambiaremos el objeto que exporta nuestra aplicación
  sustituyendo `exports.helloWorld` por `exports.app`.

```javaScript
const functions = require('firebase-functions');
const express = require('express');
const app = express();

app.get('/timestamp', (request, response) => {
  response.send(`${Date.now()}`);
});

exports.app = functions.https.onRequest(app);
```

  Tras esto estamos casi listos para desplegar nuestra primera aplicación con
  firebase, ahora tenemos que ir a la raíz del proyecto y abrir `firebase.json`
  y en él añadir la ruta dentro del hosting. He eliminado el resto de
  información que tiene el objeto para evitar confusiones.

```json
{
"hosting": {
  //some other things
  "rewrites": [{
    "source": "/timestamp",
    "function": "app"
  }]
}
}
```

  Si queremos añadir más rutas en nuestro objeto `app` en `firebase.json`
  tenemos que cambiar `"source": "/timestamp"` por `"source": "**"` de esta
  forma todas las rutas que configuremos se redigirán a `app`.

  Ya tenemos todo listo para probar nuestra primera ruta en la aplicación. Esto
  lo haremos de manera local, para ello ejecutamos el siguiente comando y todo
  debería funcionar.

  `firebase serve --only functions,hosting`

  Si todo sale bien tendríamos que ver en nuestra terminal algo parecido a esto

```bash
user@user:~/$ firebase serve --only functions,hosting

=== Serving from '/home/user/Documents/project-directory'...

i  functions: Preparing to emulate functions.
i  hosting: Serving hosting files from: public
✔  hosting: Local server: http://localhost:5000

✔  functions: app: http://localhost:5001/project-name/us-central1/app
```

  Y ya podremos usar sin problema si vamos a `http://localhost:5000/timestamp`
  veremos el resultado de nuestra función. Si queremos desplegar nuestra
  aplicación en el hosting por defecto que nos presta firebase lo podremos hacer
  ejecutando el siguiente comando. Esto funcionará si hemos vinvulado en el los
  primeros pasos nuestro proyecto con firebase.

  `firebase deploy`

  Una vez termine te indicará la url por defecto que se te ha asignado. El
  resultado debe ser similar a este.

```bash
user@user:~/$ firebase deploy

=== Deploying to 'project-name'...

i  deploying functions, hosting
i  functions: ensuring necessary APIs are enabled...
✔  functions: all necessary APIs are enabled
i  functions: preparing functions directory for uploading...
i  functions: packaged functions (936 B) for uploading
✔  functions: functions folder uploaded successfully
i  hosting: preparing public directory for upload...
✔  hosting: 2 files uploaded successfully
i  functions: updating function app...
✔  functions[app]: Successful update operation.

✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/project-name/overview
Hosting URL: https://project-name.firebaseapp.com
```

Problemática
--------------------------------------------------------------------------------

  En mi caso he tenido varios problemas.

### No me reconoce la ruta `/`

  Si queremos que nuestra aplicación funcione la ruta

  `app.get('/', (request, response) => {});`

  y haga lo que le hemos indicado en nuestra aplicación hay que tener cuidado
  con lo que genera firebase por defecto. Si nos fijamos en nuestro
  directorio `public` tenemos un fichero `index.html` si no lo borramos el
  hosting por defecto mostrará este fichero HTML ignorando nuestra
  configuración de la aplicación.

### Permisos

  El primero de ellos con los permisos de los directorios donde estaba
  instalado firebase globalmente. En los `log` del sistema me decía que no
  podía acceder/crear un nuevo directorio en la ruta. Lo que hice para
  solucionar ha sido cambiar los permisos de esta ruta para que mi usuario
  pueda acceder a ella de la siguiente forma.

  `sudo chown -R $(whoami) /usr/local/lib/node_modules/`

### Versión de Node

  El segundo de ellos ha sido la versión de *node* instalada en el sistema. Yo
  tenía la *6.11.4* y firebase era compatible a partir de la __6.11.5__ según
  decía el mensaje de error. Para ello instalé el [nvm] (Node Version Manager),
  ya que tengo otro poryecto que usa esta versión anterior y no quiero que le
  pase nada.

  En el propio repositorio explica paso a paso como instalarlo. Con él instalado
  hice `nvm install node` con lo que me descargué la última versión *10.4.0* en
  este momento. Volví a tratar de ejecutar la aplicación en local y me decía que
  la versión seguía siendo la antigua. Esto es porque había cambiado de versión
  en otro terminal. Para que los cambios surtieran efecto tendria que volver
  a cambiar la version de node en el terminal donde estaba trabajando con
  firebase o pasarme a usar este que ahora tengo con la version buena. En
  cualquier caso cada vez que iniciemos un nuevo terminal este tendrá por
  defecto la última versión de node siempre.

  Pero todo no acaba aquí, resulta que la versión de firebase en la que estoy
  solo acepta *node 6.11.5* justo la versión siguiente en la que me encontraba.
  Así que una vez más `node install 6.11.5` y con todo esto por fin pude ver en
  local mi proyecto.

  Para cambiar a la versión en la que me encontraba usé `node use 6.11.4` y
  en caso de querer usar la última existe un alias que puedes usar
  `node use default` con el que pasas a la 10.4.0 la más actual que dispongo.

Referencias
--------------------------------------------------------------------------------

* [Video original][original-video] de google en inglés.
* [Firebase Hosting][firebase-hosting], documentación oficial.
* [Node][node], documentación oficial.
* [SPA] Single Page Application o Aplicación de Página Única.
* [Repositorio][nvm] donde enconrar las instrucciones de instalacion de [nvm]
* [Java Script][javaScript] es el lenguaje que uso en los ficheros que muestro.

[original-video]: https://youtu.be/LOeioOKUKI8
[firebase-hosting]: https://firebase.google.com/docs/hosting/?hl=es-419
[node]: https://nodejs.org/es/docs/
[SPA]: https://en.wikipedia.org/wiki/Single-page_application
[nvm]: https://github.com/creationix/nvm
[javaScript]: https://www.javascript.com/

