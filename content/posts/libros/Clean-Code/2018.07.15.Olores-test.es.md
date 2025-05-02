---
title: "Olores del código: test"
slug: "olores-del-codigo-test"
date: 2018-07-14T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---

Olores del código: test
================================================================================

  Existen muchas cosas que no huelen bien en el código y a continuación vas a
  poder ver las referentes a los test. Esta es una publicación
  parte de una serie de publicaciones que haré referentes a olores del código.

Test
--------------------------------------------------------------------------------

  1. __Test insuficientes__, ¿cuantos test debe tener mi *suite*? Siento tener
  que decírtelo pero no hay una métrica para ello. Tienes que tener tantos test
  como para probar todo lo que puede fallar. Aunque he escuchado decir que 
  normalmente con tener un __80% de la aplicación testada__ puede valer.
  2. __Usa una herramientas de cobertura__, existen herramientas que te hacen
  análisis sobre la cobertura de tus test (a veces los propios IDE´s lo tienen
  integrado). Estas te analizan que partes están cubiertas con un test y cuales
  no, te hacen tener una visión de como está el proyecto.
  3. __No te saltes los test triviales__, en ocasiones puedes pensar que este
  test es demasiado obvio como para comprobarlo. Pero la verdad es que este tipo
  de test tienen más valor como documentación que como comprobación en sí mismo.
  Hazlos y deja reflejado ese comportamiento.
  4. __Un test ignorado es una pregunta sobre ambigüedad__, a veces no tenemos
  claro el comportamiento de algún detalle de comportamiento. Esto lo podemos
  dejar reflejado como un test comentado o ignorado, de esta manera esta
  cuestión queda reflejada en el código y será más fácil de solucionar.
  5. __Testea condiciones del entorno__, a menudo nos podemos encontrar delante
  de una solución conrrecta pero ser el entorno quien nos genera errores. Es por
  ello que hay que tener en cuenta las condiciones del entorno.
  6. __Testear exhaustivamente cerca de los bugs__, cuando encontramos un bug
  en una función es muy probable que no se encuentre solo. Es por ello que una
  vez encuentras un bug es recomendable testar esa función a fondo,
  probablemente encuentres más errores.
  7. __Los test deben de ser rápidos__, un test lento es un test que no se va a
  ejecutar. Cuando estás ejecutando la *suite* de test constantemente el test más
  lento es el test que terminarás por saltar. Este hará que tu ritmo de trabajo
  baje y te cansarás, por eso es mejor que los test sean lo más rápido posible.

Referencias
--------------------------------------------------------------------------------

* [Libro original] sobre Clean Code, esta publicación corresponde con el
capítulo 17.

<!------------------------------ All links here -------------------------------> 

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413

