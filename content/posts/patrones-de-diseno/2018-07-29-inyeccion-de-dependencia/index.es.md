---
title: "Inyección de dependencia"
slug: "patrones-de-diseño/inyeccion-de-dependencia"
date: 2018-07-28T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [patrones de diseño]
---


  La [inyección de dependencia] consiste, como su nombre indica, en añadir,
  insertar dependencia a un objeto. Esto no es recomendable porque creas
  una dependencia grande entre objetos. Pero en ocasiones es la mejor
  solución que tenemos para asegurarnos de que el objeto __B__ que usamos
  __dentro__ del objeto __A__ es el que queremos y como lo queremos, en lugar de
  uno que importemos.

  [inyección de dependencia]:
  https://es.wikipedia.org/wiki/Inyecci%C3%B3n_de_dependencias

  Una interfaz puede ser algo como `IDisposable`, `IEnumerable` o
  `IPrintable`. Una clase es una implementación real de una o más de estas
  interfaces: `List` o `Map` pueden ser implementaciones de IEnumerable.

  Para entendernos: a menudo tus clases dependen unas de otras. P.ej.
  puedes tener una clase `database` que acceda a su base de datos, pero
  también deseas que esta clase inicie sesión para acceder a la base de
  datos. Supongamos que tiene un registrador (`logger`) entonces la base
  de datos tiene una dependencia al registrador.

  Hasta aquí todo bien.

  Puede modelar esta __dependencia dentro__ de su clase de Base de Datos con la
  siguiente línea:

  `var logger = new Logger ();`

  y todo está bien Está bien hasta el día en que se da cuenta de que necesita
  un grupo de registradores: a veces desea iniciar sesión en la consola, a
  veces en el sistema de archivos, a veces usando TCP / IP y un servidor de
  registro remoto, y así sucesivamente...

  Y, por supuesto, __NO__ quieres cambiar todo tu código (mientras tanto, tienes
  miles de millones) y __reemplazar todas las líneas__

  `var logger = new Logger ();`

  por:

  `var logger = new TcpLogger ();`

  Primero, esto no es divertido. En segundo lugar, esto es __propenso a
  errores__. Tercero, este es un trabajo estúpido y repetitivo para un mono
  entrenado. Entonces, ¿Qué haces?

  Obviamente, es una buena idea __introducir una interfaz__ `ICanLog` (o
  similar) que implementan todos los registradores. Así que el paso 1 en tu
  código es lo que haces:

  `ICanLog logger = new Logger ();`

  Ahora que la inferencia de tipo ya no cambia de tipo, siempre tienes __una
  única interfaz__ contra la cual desarrollar. El siguiente paso es que no desee
  tener un nuevo `Logger()` una y otra vez. Así que pones la fiabilidad para
  crear instancias nuevas en una única clase central de fábrica y obtienes un
  código como:

  `ICanLog logger = LoggerFactory.Create ();`

  La fábrica misma decide qué tipo de registrador crear. A su código ya no le
  importa, y si desea cambiar el tipo de registrador que está utilizando,
  cámbielo una vez: Dentro de la fábrica.

  De esta manera __con la interfaz te aseguras que todas las implementaciones
  de registrador, sea cual sea actúen de la misma forma__ ya que implementan la
  misma interfaz. Esta última último tramo de la publicación es una
  traducción de una respuesta en _[StackOverflow]_ la respuesta completa
  [aquí][response].

  [StackOverflow]: https://stackoverflow.com
  [response]: https://stackoverflow.com/a/14301496/5732392

