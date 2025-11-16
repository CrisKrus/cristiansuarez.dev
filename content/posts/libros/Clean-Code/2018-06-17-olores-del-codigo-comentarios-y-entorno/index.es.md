---
title: "Olores del código: comentarios y entorno"
slug: "libros/olores-del-codigo-comentarios-y-entorno"
date: 2018-06-16T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, comentarios, documentación]
---


  Existen muchas cosas que no huelen bien en el código y a continuación vas a
  poder ver las referentes a comentarios y al entorno. Esta es una publicación
  parte de una serie de publicaciones que haré referentes a olores del código.

Comentarios
--------------------------------------------------------------------------------

  Se que lo hemos hablado en varias ocasiones pero una vez más, los comentarios
  no son una mejora del código. Al contrario, suelen entorpecer más de lo que
  ayudan por las siguientes razones:

  1.__Información inapropiada__, no hace falta añadir meta-datos a un fichero
  con comentarios. Cosas como fecha de última modificación, autor, etc no son
  necesarios y sólo generan ruido.

  2.__Comentarios obsoletos__, tener comentarios explicando una parte de código
  es algo común (no he dicho que esté bien, es común solo eso). Pero la realidad
  es que esos comentarios nadie se encarga de mantenerlos y quedan rápidamente
  desfasados con el código al que está atado. Porque si tu cambias el
  funcionamiento de un método porque no está correcto, no te acuerdas de
  modificar el comentario que lo explicaba.

  3.__Comentarios redundantes__, ya que no me vas a hacer caso y vas a poner un
  comentario, al menos que no diga lo mismo que puedo ver `i++; //increment i`
  no lo hagas.

  4.__Comentarios pobres__, si sigues pensando que hace falta poner un
  comentario, al menos escribe el mejor que puedas. Usa la terminología del
  contexto en el que estás y no generes más confusión de la que ya hay.

  5.__Código comentado__, por favor esto nunca. No dejes código comentado suelto
  por tu clase, este código nadie lo borra porque nadie sabe porqué está ahí. Y
  la realidad es que con cada día que pasa se vuelve más irrelevante, la
  variables que usa dejan de existir, lo métodos a los que llama cambian la
  firma, etc. Si está comentado, bórralo no es necesario. Si alguien lo necesita
  puede volver a la versión anterior de tu [sistema de control de versiones] y
  verlo.

Entorno
--------------------------------------------------------------------------------

  1.__Desplegar requiere más de un paso__, si tienes una aplicación esta tiene
  que ser fácil de desplegar un paso, dos como mucho. No debes tener que
  comprobar decenas de ficheros, ver que dependencias falta y complicarte la
  vida a ti y a quien quiera usarlo. Tendrías que ser capaz de hacer algo
  parecido a esto `get application`, `cd application`, `deploy application`,
  `run application`.

  2.__Test requiere más de un paso__, al igual que el caso anterior esta tiene
  que ser fácilmente testable. Tiene que poder ser testada con un simple
  comando que ejecute todos los test.

Referencias
--------------------------------------------------------------------------------

* [Libro original] sobre Clean Code, esta publicación corresponde con el
capítulo 17.
* [Sistema de control de veriones][sistema de control de versiones]

<!------------------------------ All links here ------------------------------->

[sistema de control de versiones]: https://es.wikipedia.org/wiki/Control_de_versiones
[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
