---
title: "Concurrencia"
slug: "concurrencia"
date: 2018-05-26T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---

Concurrencia
================================================================================

  Concurrencia... Aaaah mi amiga la concurrencia, como te quiero y te odio a la 
  vez. Tú junto con la recursividad has sido, de momento, los dos conceptos que 
  más me ha costado entender en la informática. Es de esas cosas que o entiendes 
  a la primera o tardas tiempo hasta que un día, hace "click" en tú cabeza y 
  todo cobra sentido, vamos a por ti ¿eres realmente tan necesaria?

¿Que es la concurrencia?
--------------------------------------------------------------------------------

  La concurrencia, resumiendo mucho, consiste en poder hacer mas de una tarea en 
  el mismo instante de tiempo. Llevado al mundo de la programación dos 
  funciones/métodos/ejecuciones están ejecutándose al mismo tiempo.

Problemas que surgen
--------------------------------------------------------------------------------

  Imaginemos que tenemos un simple programa que incrementa un contador, turno 
  para ser atendidos, cada vez que un usuario pulsa un botón, fácil ¿no? Una 
  clase con un campo contador y un método que devuelve el contador y le suma una 
  unidad. Pues si este trabajo lo hacemos concurrente pongamos que con tres 
  usuarios que llegan en el mismo instante de tiempo y lo solicitan a la vez 
  pueden ocurrir muchas cosas si no controlamos este contador como debemos. 
  Puede ser que el primer usuario tenga el número 15, luego el segundo el 16 y 
  quede un 17 para el siguiente, suerte todo ha salido bien. O puede que al ser 
  la petición al mismo tiempo ambos tengan el 15 y quede el 16 para el 
  siguiente. O aún peor puede que el primero tenga el 15 el segundo el 16 pero 
  quede un 16 para el siguiente que venga. En la concurrencia todo es posible.

Los hilos deben ser independientes  
--------------------------------------------------------------------------------

  Cuando trabajamos con concurrencia y creamos nuestros __hilos__ para dar 
  solución al problema estos deben ser lo más independientes posibles, porque no
  te puedes basar en el estado de otro hilo en ningún momento ya que este va a 
  su ritmo al igual que tú, puede que estés esperando algo que aún no ha 
  ocurrido.

Ejemplos
--------------------------------------------------------------------------------

### Productor-Consumidor
 
 Uno de los ejemplos típicos en la concurrencia es el del la __pila__ de 
 productos en la que una persona se encarga de añadir objetos a ella y otro de 
 consumir de la misma. El que produce tiene que esperar a tener espacio para 
 añadir el nuevo objeto y el que consume tiene que esperar a que exista 
 algún objeto en la pila para poder consumir. Para lograr estar coordinados el 
 consumidor y el productor mandan señales de aviso el uno al otro, quien produce 
 cada vez que añade un producto __avisa__ que la pila no está vacía y el 
 consumidor cada vez que saca un objeto __avisa__ de que la pila no está llena. 
 Así ambos saben que pueden actuar.
  
### Lectores-Escritores

  Otro ejemplo conocido es el de lectores y escritores. Si tenemos un documento 
  el cual puede ser leído y escrito por múltiples personas no se puede 
  solucionar de igual forma que el anterior, pues si el escritor no puede actuar
  sobre el documento hasta que el/los lector/es terminen con él puedes tener 
  múltiples lectores, que se acumulen y que nunca llegue a estar libre el 
  documento. Hay que buscar una forma de hacerlo de manera más equilibrada.
  

Conclusión
--------------------------------------------------------------------------------

  La concurrencia de código no es trivial, cuesta de comprender y mucho más de 
  manejar con correctitud. Si estás pensando en empezar con ella, tómatelo con 
  calma y no esperes que todo cobre sentido en un día. 

Referencias
--------------------------------------------------------------------------------

* [Libro original]


<!--------------------- All links here ----------------------------------------> 

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
