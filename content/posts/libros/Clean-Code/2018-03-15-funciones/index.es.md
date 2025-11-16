---
title: "Funciones"
slug: "libros/funciones"
date: 2018-03-15T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, funciones, diseño]
---


  Como ya vimos en el capítulo anterior nombrar coherentemente es importante, 
  pero no es lo único que tenemos que hacer. Las funciones si están bien 
  nombradas pero ocupan 3.000 líneas no son precisamente algo manejable, y 
  buscar donde se produce un error en ellas será un dolor de cabeza. El libro
  recomienda que cada función ocupe tanto como abarque tu pantalla, siempre y
  cuando esta no sea extremadamente grande, unas 20 (llegando al límite, pero
  con la mitad sobra para poder cumplir con su objetivo la función)

Haz solo una cosa!
--------------------------------------------------------------------------------

  Por ello mantener funciones que sean pequeñas en cuanto a líneas de código y
  funcionalidad es importante. No debes de liarte y hacer en un mismo bloque 
  100 cosas distintas, haz **una sola cosa por cada función**, dale un buen 
  nombre y así sarbás a donde acudir cuando falle.

Identación
--------------------------------------------------------------------------------

  Otro punto importante es la identación es algo que si sigues el consejo 
  anterior se soluciona un poco. La cuestión de este punto es que no debes 
  comenzar a encadenar condiciones (por ejemplo, _if {} else_), aumentándo la
  identación del código con cada una de ellas, hasta llegar a salir de la 
  pantalla. Esto hace que no sea legible de manera rápida y cómoda y más 
  fácil de liarte a la hora de revisar el trabajo ya hecho.

Switch
--------------------------------------------------------------------------------

  Esta sentencia por como está diseñada es difícil que ocupe poco, ya que con 
  tres opciones solamente se extiende 12 líneas. Además si queremos modificar
  este porque ha cambiado los requisitos de nuestra aplicación un switch nos 
  dará problemas, no siendo la mejor opción. Para evitar que esto ocurra nos 
  recomienda hacer el uso de la **abstracción**.

Argumentos
--------------------------------------------------------------------------------

  Cuando declaramos una función a veces nos olvidamos de que los argumentos 
  luego tendremos que completarlos al hacer uso de esa y comenzamos a 
  solicitar una gran cantidad de ellos. Esto hace que luego cuando la 
  llamemos quede un churro en medio de nuestro código con muchos parámetros 
  que nos chocará cuando estemos leyendola. Además de que siempre será más 
  complicado de modificar en un futuro. En el libro nos recomiendan, que cada
  función como máximo deba tener 3 parámetros. Si hace uso de más de estos la
  mayoría de veces significa que lo que necesitas no son los parámetros como
  tal, si no un objeto con todos estos atributos. Por ejemplo si queremos 
  pintar un punto en pantalla, podremos pedir como parámetros: **coordenada 
  X, coordenada Y, radio**. Pero si nos fijamos realmente las dos primeras 
  pertenecen a lo mismo, un punto, si en lugar de esto simplemente 
  solicitamos **punto** y **radio** queda todo más claro.

Nombrar correctamente
--------------------------------------------------------------------------------

  Las funciones deben de ser nombradas como verbos (acciones) de manera que 
  sean ejemplificativas de que están haciendo en su interior sin tener que 
  investigarla. Por esta misma razón es importante que no hagamos dentro de 
  una función más de lo que decimos hacer, si tenemos una función 
  **comprobarConección** no debemos hacer más que la comprobación, si se nos 
  ocurriera que, una vez comprobado su correcto estado la inicializamos, 
  tendríamos que llamar de mejor manera a esta algo como: 
  **comprobarConecciónEIniciar**

Argumentos de salida
--------------------------------------------------------------------------------

  Estos argumentos existen por razones historicas, desde la llegada de la 
  **Orientación a Objetos** (_OO_) carecen de sentido, es más hacen que las 
  funcuiones no sean tan claras como deberían. Si una función tiene que 
  devolver algo, esto lo hará por su parámetro de salida (su _return_) no por
  un argumento pasado que es un objeto que modificamos. Si tenemos que 
  modificar un objeto lo haremos de la siguiente forma:

  ```Java
  objeto.actualizarParámetro();
  ```

Códigos de error
--------------------------------------------------------------------------------

  De igual forma los códigos de error no son nada aconsejable, si los usamos 
  tendremos que comprobar si el valor entra dentro de uno de los códigos de 
  error que existen para esa función y luego actuar en consecuencia. Esto 
  hace que el código se haga más complejo añadiendo comprobaciones 
  innecesarias que con excepciones sería más fácil dentro de un bloque _try 
  {} catch_

[Libro original]
--------------------------------------------------------------------------------

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
