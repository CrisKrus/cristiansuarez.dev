---
title: "Usar PUG en Firebase"
slug: "firebase/usar-pug-en-firebase"
date: 2018-08-18T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [firebase]
---

  Usar PUG en Firebase
================================================================================

  Si ya tenemos nuestra aplicación funcionando con [firebase hosting] y
  [firebase functions] podemos añadir el sistema de plantillas [PUG], por
  ejemplo, para mostrar las pantallas dinámicamente de manera fácil.

  Si no tienes tu aplicación ya en funcionamiento con estas tecnologías, en este
  [post] muestro como se hace y se automatiza el despliegue.

[firebase hosting]: https://firebase.google.com/docs/hosting/
[firebase functions]: https://firebase.google.com/docs/functions/
[PUG]: https://pugjs.org/api/getting-started.html
[post]: https://criskrus.com/index.php/2018/08/12/233/

  Primero que nada tendremos que añadir la dependencia de [PUG]

```bash
npm install pug --save
```

  Ahora en nuestro `index.js` podremos indicarle que estamos usando este sistema
  de plantillas y posteriormente usarlas. En nuestro caso se encuentra dentro
  del directorio `/functions`.

```JavaScript
app.set('view engine', 'pug');
app.set('views', 'views');

// ...

app.get('/', (request, response) => {
    response.render('index');
});
```

  Y como le hemos indicado en el paso anterior que las vistas están en el
  directorio `/view` es ahí donde tenemos que crear nuestro `index.pug`

```PUG
doctype html
html(lang="es")
    head
        meta(charset='UTF-8')
        title= 'Saber y Ganar'
        link(href='/css/styles.css', rel='stylesheet')
        script(src='https://www.gstatic.com/firebasejs/5.0.4/firebase-app.js')
        script(src='https://www.gstatic.com/firebasejs/5.0.4/firebase-database.js')
    body
        p Hello World!
```

  Si hemos seguido todos los pasos y configurado todo correctamete al abrir
  nuestra aplicación se nos mostrará nuestra plantilla.

Ejemplo
--------------------------------------------------------------------------------

  Tengo un proyecto de ejemplo de preguntas y respuestas donde uso este sistema
  de plantillas. Está en el siguiente [repo] de GitHub.

[repo]: https://github.com/CrisKrus/juego-saber/

