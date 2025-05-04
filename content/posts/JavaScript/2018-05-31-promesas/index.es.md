---
title: "Promesas"
slug: "javascript/promesas"
date: 2018-05-30T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---

Promesas
================================================================================

  De donde vienen y porque surge la necesidad. 
  
  The callback hell, callbacks anidados unos dentro de otros sin parar es algo 
  comun en [javaScript]
  
  Es un objeto que se crea con el new que recibe como parametro un callback pero
  solo uno y este como parametros dos callbacks que son los casos de que la 
  promesa termine bien y en caso de que ocurra un error.
  
  Tienen dos metodos principales `then()` y `catch()` los cuales se ejecutan 
  cuando la promesa termina de manera correcta o erronea respectivamente.
  
````````````````````````````````````````````````````````````````````````````````
ejemplo promesa
````````````````````````````````````````````````````````````````````````````````
  
  Estos metodos son importantes porque con ellos se les indica que hara la 
  promesa cuando termine su ejecucion, se le puede añadir tantas cosas como se 
  quiera.
  
````````````````````````````````````````````````````````````````````````````````
ejemplo promesa con muchos then anidados, se ve mas legible
````````````````````````````````````````````````````````````````````````````````
  
  Los then van encadenando la salida del anterior, si tienes varios encadenados
  el `return` del primero es la entrada del segundo. Esto es muy potente porque 
  supongamos el primero resuelve con el servidor tratamos los datos y con estos 
  tenemos que hacer una nueva peticion al servidor, pues creamos una nueva 
  promesa con ello.
    
Title 2
--------------------------------------------------------------------------------
    
  Now I'll put some code here:
  
````````````````````````````````````````````````````````````````````````````````
let text = 'Hello World!';
return text;
````````````````````````````````````````````````````````````````````````````````
    
  This is about [javaScript]
    
    
References
--------------------------------------------------------------------------------

* [Video original][original-video]
* [Java Script][javaScript]


<!-- All links here --> 

[original-video]: https://www.youtube.com/watch?v=hRIU7463Ifo
[javaScript]: https://www.javascript.com/
