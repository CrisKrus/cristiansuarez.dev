---
title: "Extraer un modulo, testearlo y sustituirlo por el anterior"
slug: "javascript/extraer-un-modulo-testearlo-y-sustituirlo-por-el-anterior"
date: 2018-05-21T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
tags: [testing, javascript, programación]
---

  Duplicar el codigo en un nuevo objeto, exportar este si no lo estaba para 
  que sea accesible desde fuera y comenzar el test. Una vez ya podemos 
  testearlo hacer los test necesarios. Con ello podremos comenzar a cambiar el 
  modulo y a hacer el refactor. 
  
  Esto es como se hacía en ES5
  
````````````````````````````````````````````````````````````````````````````````
let saberganar = saberganar || {};
(function(namespace) {
    namespace.questionNavigator = function (question) {
        // all implementation code here
    }
})(saberganar);
````````````````````````````````````````````````````````````````````````````````

  comprobamos si nuestro `namespace` *saberganar* existe, si no partimos de 
  uno vacio, y le añadimos a este nuestro modulo nuevo `questionNavigator`.

````````````````````````````````````````````````````````````````````````````````
let saberganar = saberganar || {};
saberganer.questionNavigator = function (question) {
    // all implementation code here
}
````````````````````````````````````````````````````````````````````````````````

  una vez tenemos esta funcion creada en un fichero a parte hacemos que 
  nuestra aplicacion acepte como parametro una funcion la cual sera nuestro 
  nuevo modulo que acabamos de exportar y hacer el refactor.
  
````````````````````````````````````````````````````````````````````````````````
var saberganar = saberganar || {};

saberganar.game = function(questionNavigator){
    function start(){
        theQuestionNavigator = questionNavigator;
        // [...]
    }
    // [...]
}
````````````````````````````````````````````````````````````````````````````````
  
  \*__Nota__: el `let saberganar` da problemas tiene que definirse con `var`, 
  puede que sea por el contexto o por como funciona el `let`
  
    
## Extraer en ES6

Partimos de un fichero con toda la aplicacion

patron factory en el `window.onload ...` construye la aplicacion todas sus 
partes en este caso solamente es una, poner el questionsNavigator

