---
title: "Refinamiento Sucesivo"
slug: "libros/refinamiento-sucesivo"
date: 2018-06-02T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---


  Si te mostrara ahora un trozo de código y te dijese: "Mira que limpio está"
  podrías pensar que esto ha salido a la primera de mi cabeza porque soy muy
  bueno pero no es así. Cuando escribes un código la mayoría de veces te pasará
  que empiezas a hacer cosas "porque funcionan" sin pensar mucho en las buenas
  prácticas sobretodo cuando estás empezando con ellas. Pero no por eso debes
  dejarlo pasar.

  El código que escribas debes considerarlo como un borrador que siempre tiene
  mejoras pendientes, cada vez que hagas una funcionalidad antes de considerarla
  hecha dale una vuelta, revísala como si fuera de tu amigo o compañero y trata
  de mejorarla (siempre se puede). Es por ello que en este capítulo del libro
  muestra una clase que implementa y como al verla en su "forma final" gusta
  pero cuando te enseña las primeras versiones ves que realmente no era tan
  bonita en sus inicio que se ha llevado varios refinamientos para dejarla en el
  punto en el que se encuentra ahora.

En Incrementalismo
--------------------------------------------------------------------------------

  La mejor forma de romper un programa que funciona es hacer __cambios de
  nombres__ "para mejorar" la legibilidad __en masa__ esto no suele llegar a
  buen puerto nunca... Suele generar problemas, conflictos con otros nombres, y
  un largo etcétera. Para poder hacer estos cambios tranquilos hay una solución
  [__TDD__][TDD], esto junto con hacer muchos cambios pequeños que vamos
  comprobando.

  En este caso las comprobaciones las podremos hacer de manera  automáticas con
  los test que tendremos hechos para nuestro programa. De manera que después de
  cada cambio ejecutamos los test y si estos fallan volveremos al estado
  anterior donde todo funcionaba, no haremos cambios que rompan el programa. O
  en caso de que lo que se rompa sea poca cosa y veamos que se puede solucionar
  porque no era así como debería funcionar, podemos solucionarlo pero como
  estábamos hablando de cambios de nombres a variables y métodos normalmente si
  estos generan un problema no suele ser tan trivial.

Conclusión
--------------------------------------------------------------------------------

  Es por todo ello que el código que hacemos no se considera terminado cuando
  funciona, porque hacer que funcione algo puede hacerlo cualquiera pero los
  buenos programadores además lo hacen de manera limpia y lo dejan con pruebas
  para evitar que los cambios lo rompan.

Referencias
--------------------------------------------------------------------------------

* [Libro original]
* [TDD], Test Driven Development o Desarrollo Dirigido por Test.


### Notas

  Durante todo el capítulo el autor hace cambios en su primera versión del
  código y va explicando cada uno de ellos la línea que sigue de pensamiento.
  Subiré estos cambios explicados de manera calmada en el futuro.

<!--------------------- All links here ---------------------------------------->

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
[TDD]: https://es.wikipedia.org/wiki/Desarrollo_guiado_por_pruebas
