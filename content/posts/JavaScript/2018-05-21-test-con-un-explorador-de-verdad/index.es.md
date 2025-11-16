---
title: "Test con un explorador de verdad"
slug: "javascript/test-con-un-explorador-de-verdad"
date: 2018-05-20T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
tags: [testing, javascript, programación]
---

  Puedes ver como el explorador se abre y va haciendo clicks en los 
  enlaces, etc. Test __end2end__, estos test son buenos cuando la
  aplicación a probar no es testable, probamos directamente la
  interfaz como si fueramos un usuario final. Pero por otra parte si
  en el futuro la interfaz cambia ya sea porque tiene otro ID el botón
  o ya no existe, los test dejaran de funcionar.
  Estos test se deben de usar solo como andamio, debido a su fragilidad
  debemos usarlo cuando no sea posible hacer test de otra forma y
  durante la fase de *refactor* hasta que tengamos un aplicacion
  testable.
  
  Uno de los cambios que hace Carlos es poner una nueva función que exporta
  con la que poder iniciar los datos que usa la aplicación si queremos (en
  caso de estar testando) y si no pone unos datos por defecto.
  
  Luego pasa a los test y crea uno donde empieza el juego, selecciona la
  primera respuesta, pulsa el boton de responder pregunta y comprueba que la
  pregunta ha cambiado.
    

