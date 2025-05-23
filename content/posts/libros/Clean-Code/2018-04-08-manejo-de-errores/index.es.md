---
title: "Manejo de errores"
slug: "libros/manejo-de-errores"
date: 2018-04-07T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---


  Puede sonar raro hablar de errores en un libro que trata sobre código limpio,
  pero los errores son algo que ocurre porque somos humanos y como tal erramos.
  Un usuario puede perfectamente introducir un dato no válido y esto tenemos que
  controlarlo de alguna manera.

Usa excepciones en lugar de códigos de error
--------------------------------------------------------------------------------

  Antes era normal ver en funciones _esta función devolverá un número mayor a 0
  en caso de que termine correctamente, en caso contrario -1 si no se encontró
  el fichero, -2 si no se pudo acceder, etc_. Esto ocurría porque no existían
  excepciones, a día de hoy hacer esto solo hace que el código de quien usa tu
  función se ensucie al tener que controlar si el valor devuelto es válido o no
  y porque no lo es. En lugar de esto todo queda más limpio si cuando ocurre un
  error lanzamos una excepción.

Usa excepciones sin marcar (_**Un**checked Exceptions_)
--------------------------------------------------------------------------------

  Las _checked exceptions_ son aquellas que tienen que estar en la firma del
  método reflejadas como que pueden ocurrir en algún momento. En los inicios
  cuando Java las añadió parecían una buena idea, pero con el paso de los años
  se han dado cuenta que no son tan necesarias como pensaban. Esto ocurre porque
  si, tiene sus ventajas, pero también sus inconvenientes.

  Uno de ellos es que estas no respetan el **principio abierto/cerrado**
  (_[Open/Closed Principle]_). Imaginemos, lanzamos un nuevo _checked
  exception_ en un método y el _catch_ de este está tres niveles por debajo en
  la implementación. Tendremos que ir nivel por nivel cambiando la firma de
  todos los métodos para que la aplicación compile nuevamente... Esto no parece
  una buena idea, y eso que solo son tres niveles si se tratase de una
  aplicación grande en la que hay muchos más niveles pasaremos una buena tarde
  cambiando todos los niveles. Esto podemos evitarlo usando _**un**checked
  exceptions_.

Explica el contexto de tu excepción
--------------------------------------------------------------------------------

  Si creas una excepción, se lo más claro posible explicando el contexto y la
  localización del error en el mensaje. ¿Porqué ha ocurrido esta excepción?

Define el flujo normal
--------------------------------------------------------------------------------

  No hay porque crear excepciones sin pensar hay casos en los que, con cambiar
  la  lógica de nuestra aplicación solucionamos el problema. Supongamos lo
  siguiente:

  ``````````````````````````````````````````````````````````````````````````````
  try {
    GastosDeComida gastos = reporteDeGastos.obtenerComida(idEmpleado);
    gastosTotales += gastos.obtenerTotal();
  } catch (GastosDeComidaNoEncontrados e){
    gastosTotales += obtenerComidaPorDia();
  }
  ``````````````````````````````````````````````````````````````````````````````

  En este ejemplo si no encontramos los gastos en comida del empleado lanzamos
  una excepción y entonces añadimos la comida por días pero, ¿porqué generamos
  esta excepción? Si en lugar de lanzar la excepción controlamos en el método
  **obtenerTotal()**, si no hay total en este empleado devolvamos la comida por
  día, de manera que pase lo que pase siempre devolveremos un dato con el que
  poder trabajar y todo se soluciona evitando todo esto.

No devuelvas nulos
--------------------------------------------------------------------------------

  Si has trabajado con Java un tiempo, es normal que en algún momento te
  encuentres creando algo como esto:
  
  ``````````````````````````````````````````````````````````````````````````````
  if(usuario != null){
    Tarea[] tareas = usuario.obtenerTareas();
    if(tareas != null){
      ...
    }
  }
  ``````````````````````````````````````````````````````````````````````````````
  
  Puede incluso que te parezca hasta normal ¡pero no lo es! si estás creando una
  clase y devuelves un nulo recuerda, te estás dejando más trabajo para el
  futuro. Puedes pensar que no es para tanto, una comprobación de si es nulo o
  no y ya está pero veamos, que ves más fácil de comprender y ver de primeras
  entre estos dos códigos:
  
  ``````````````````````````````````````````````````````````````````````````````
  List<Empleado> empleados = obtenerEmpleados();
  if(empleados != null){
    for(Empleado e: empleados){
      pagoTotal += e.obtenerPago();
    }
  }
  ``````````````````````````````````````````````````````````````````````````````
  
  ``````````````````````````````````````````````````````````````````````````````
  List<Empleado> empleados = obtenerEmpleados();
  for(Empleado e: empleados){
    pagoTotal += e.obtenerPago();
  }
  ``````````````````````````````````````````````````````````````````````````````

  Creo que ves por donde voy, la segunda opción queda más clara. Pero además
  dejando la claridad y lo bonito que queda supongamos que se te olvida hacer
  la comprobación de si es nulo o no, ¿ahora que? a buscar en la pila del error
  porque es nulo y donde y como tengo que hacer para solucionarlo. Y todo porque
  cuando implementaste la función **obtenerEmpleados()** no hiciste una
  comprobación del tipo _si no hay empleados devuelvo **una lista vacía**_.

No pases nulos como parámetros
--------------------------------------------------------------------------------

  Si devolver nulos está mal, ¡pasarlos como parámetros es aún peor! Imagina que
  estás usando una API la cual no espera que le pases un nulo, ¿que va a pasar?
  Pues lo esperado nuestro "querido" _NullPointerException_ y como lo vas a
  solucionar si la API es tuya puedes añadirle excepciones que, no deberían
  estar ahí, ensucian y hacen que sea menos claro su funcionamiento. Así que
  hazte un favor y evita los nulos de todas las formas que puedas.


[Libro original]
--------------------------------------------------------------------------------

TODO
--------------------------------------------------------------------------------
  - Escribe tu bloque _Try-Catch-Finally_ primero

[Open/Closed Principle]: https://es.wikipedia.org/wiki/Principio_de_abierto/cerrado
[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413

