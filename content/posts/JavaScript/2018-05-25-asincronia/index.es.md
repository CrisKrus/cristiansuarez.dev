---
title: "Asincronía"
slug: "javascript/asincronia"
date: 2018-05-24T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---


  En algunas ocasiones tenemos que hacer un test y que este espere un tiempo 
  hasta que una funcion termine, ya que esta es asincrona. Para ello tenemos la 
  siguiente posible implementacion.
  
````````````````````````````````````````````````````````````````````````````````
function it (theSubject, funct){
    function doneCallback() {
        console.log('done');
    }

    try {
        if (funct.length >=1) {
            funct(doneCallback);
        }
        else {
            funct();
        }
            console.log(theSubject);
        } catch (error) {
            throw theSubject + ':' + error;
        }
    }
}
it ('foo', function(doneCallback){
    var x = 1;
    cosole.log(x);
    doneCallback();
});
````````````````````````````````````````````````````````````````````````````````
  
  En ese caso el codigo es sincrono, solamente tiene un flujo de ejecucion.
  
  "Si tengo callbacks no significa que sea sincrono, pero si quiero que sea 
  sincrono tengo que usar callbacks"
  
  Los `setTimeout` y `setInterval` no son realmente paralelos el explorador 
  busca un lugar en el que este libre y lo ejecuta, siempre despues de el tiempo
  que se le ha indicado. Es decir, te asegura que esa funcion se ejecutara 
  despues de pasado ese tiempo, pero no tiene porque ser exactamente en ese 
  tiempo.
  
  En las nuevas version de ECMAScript puedes usar las funciones `await` y 
  `async` para ahorrarnos el *set up* que tenemos hasta ahora hecho. Aun con 
  estas funcionalidades no podemos dejarle todo el trabajo, tenemos que conocer
  como funcionan estas para poder usarlas correctamente y evitarnos problemas 
  que nos pueden generar por su mal uso.
  
  Concurrente != sincrono
  Concurrente al mismo tiempo
  Sincrono 
  
  `EndPoint` url a la que poder atacar con alguno de los comandoes HTTP `GET`,
  `POST`
    
AJAX
--------------------------------------------------------------------------------
  
  Ajax es uno de los ejemplos de flujos de ejecucion paralelos, tu cuando haces 
  una peticion al servidor de unos datos, no congelas la aplicacion hasta que el
  servidor te devuelva los datos. Tu haces la peticion de los datos y continuas 
  usando la aplicacion y cuando el servidor te da una respuesta la utilizas. 
  
  MDN explica muy bien todo el tema de Ajax 
  
API Json
--------------------------------------------------------------------------------
  
  
  
Promesas
--------------------------------------------------------------------------------

References
--------------------------------------------------------------------------------

* [Video original][original-video]
* [Java Script][javaScript]


<!-- All links here --> 

[original-video]: https://www.youtube.com/watch?v=hRIU7463Ifo
[javaScript]: https://www.javascript.com/

