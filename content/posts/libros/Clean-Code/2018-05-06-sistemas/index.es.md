---
title: "Sistemas"
slug: "libros/sistemas"
date: 2018-05-05T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, arquitectura, diseño]
---


En este capítulo el autor empieza con un símil que me gusta mucho y voy 
a tratar de traducir lo más fielmente que sé.

¿Cómo construirías una ciudad?
------------------------------------------------------------------------

¿Podrías administrar todos los detalles por ti mismo? Probablemente no. 
Incluso administrar una ciudad es mucho para una sola persona. Sin 
embargo, las ciudades funcionan (la mayor parte del tiempo) Funcionan 
porque tienen equipos de personas que administran partes de la ciudad, 
el sistema de agua, etc [...] Las ciudades funcionan porque tienen los 
niveles apropiados de abstracción y modularidad haciendo posible para 
las personas y "componentes" se las arreglen para trabajar 
efectivamente, sin entenderla a gran escala. Aunque los equipos de 
desarrollo a menudo se organizan así también, los sistemas en los que 
trabajan a menudo no tienen la misma separación de preocupaciones y 
niveles de abstracción. [...] En este capítulo veremos como mantenerse 
limpio a niveles altos de abstracción, **a nivel de sistema**.

Y me gusta porque realmente veo así una aplicación o producto software
 como un ente enorme que tienes que separar en pequeñas 
 "responsabilidades" para poder gestionarlo.

Separar la construcción de un sistema de usarlo
------------------------------------------------------------------------

Una de las formas de separar la construcción del uso es mover todos los 
aspectos de construcción (creación de objetos) a nuestro _main_. De esta 
maneja queda un flujo limpio y fácil de comprender, creamos todos los 
objetos que nos hacen falta en el _main_ y luego los enviamos a la parte 
de nuestra _aplicación_ donde nos sea necesario. Es decir a nuestro 
_main_ no le entra información de la aplicación solo envía hacia afuera.

### Fábricas

Esto no siempre es posible, por ejemplo si tenemos una aplicación de 
pedidos, esta tendrá que modificar la lista de pedidos añadiendo un nuevo 
objeto alguna que otra vez. Para ello podemos usar el patrón 
_[Abstract Factory]_

![abstract factory esquema]

Como podemos ver nuestro cliente (_main_) tiene una interfaz genérica 
para nuestros productos (_productoA_) y una fábrica (_AbstractFactory_), 
de esta manera el conoce que puede crear productos mediante el uso de la 
fábrica pero desconoce como esta los crea ya que es una interfaz y carece 
de detalles de implementación. A él lo único que le interesa e importa es 
que puede crearlos y usarlos.

### Inyección de dependencia

La [inyección de dependencia] consiste, como su nombre indica, en añadir, 
insertar dependencia a un objeto. Esto no es recomendable porque creas 
una dependencia grande entre objetos pero en ocasiones es la mejor 
solución que tenemos para asegurarnos de que el objeto B que usamos 
dentro del objeto A es el que queremos y como lo queremos.

Una interfaz puede ser algo como `IDisposable`, `IEnumerable` o 
`IPrintable`. Una clase es una implementación real de una o más de estas 
interfaces: `List` o `Map` pueden ser implementaciones de IEnumerable.

Para entendernos: a menudo tus clases dependen unas de otras. P.ej. 
podría tener una clase `database` que acceda a su base de datos, pero 
también desea que esta clase inicie sesión para acceder a la base de 
datos. Supongamos que tiene un registrador (`logger`) entonces la base 
de datos tiene una dependencia al registrador.

Hasta aquí todo bien.

Puede modelar esta dependencia dentro de su clase de Base de Datos con la 
siguiente línea:

`var logger = new Logger ();`

y todo está bien Está bien hasta el día en que se da cuenta de que necesita 
un grupo de registradores: a veces desea iniciar sesión en la consola, a 
veces en el sistema de archivos, a veces usando TCP / IP y un servidor de 
registro remoto, y así sucesivamente ...

Y, por supuesto, NO quieres cambiar todo tu código (mientras tanto, tienes 
miles de millones) y reemplazar todas las líneas

`var logger = new Logger ();`

por:

`var logger = new TcpLogger ();`

Primero, esto no es divertido. En segundo lugar, esto es propenso a errores. 
Tercero, este es un trabajo estúpido y repetitivo para un mono entrenado. 
Entonces, ¿Qué haces?

Obviamente, es una buena idea introducir una interfaz `ICanLog` (o similar) 
que implementan todos los registradores. Así que el paso 1 en tu código es 
lo que haces:

`ICanLog logger = new Logger ();`

Ahora que la inferencia de tipo ya no cambia de tipo, siempre tienes una 
única interfaz contra la cual desarrollar. El siguiente paso es que no desee 
tener un nuevo `Logger()` una y otra vez. Así que pones la fiabilidad para 
crear instancias nuevas en una única clase central de fábrica y obtienes un 
código como:

`ICanLog logger = LoggerFactory.Create ();`

La fábrica misma decide qué tipo de registrador crear. A su código ya no le 
importa, y si desea cambiar el tipo de registrador que está utilizando, 
cámbielo una vez: Dentro de la fábrica.

De esta manera con la interfaz te aseguras que todas las implementaciones 
de registrador, sea cual sea actúen de la misma forma ya que implementan la 
misma interfaz. Esta última último tramo de la publicación es una 
traducción de una respuesta en _[StackOverflow]_ la respuesta completa 
[aquí][response].



Referencias
------------------------------------------------------------------------
* [Libro original]
* [Abstract Factory]
* [Esquema abstract factory (imagen)][abstract factory esquema]
* [Inyección de dependencia][inyección de dependencia]
* [StackOverflow]
* [Respuesta StakOverflow][response]

<!-- All links here --> 
[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
[Abstract Factory]: https://es.wikipedia.org/wiki/Abstract_Factory
[abstract factory esquema]: https://upload.wikimedia.org/wikipedia/commons/b/b7/Diagrama_Abstract_Factory.png
[inyección de dependencia]: https://es.wikipedia.org/wiki/Inyecci%C3%B3n_de_dependencias
[StackOverflow]: https://stackoverflow.com
[response]: https://stackoverflow.com/a/14301496/5732392
