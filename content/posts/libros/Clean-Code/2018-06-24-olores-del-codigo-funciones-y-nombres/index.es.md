---
title: "Olores del código: funciones y nombres"
slug: "libros/olores-del-codigo-funciones-y-nombres"
date: 2018-06-23T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---

Olores del código: funciones y nombres
================================================================================

  Existen muchas cosas que no huelen bien en el código y a continuación vas a
  poder ver las referentes a funciones y nombres. Esta es una publicación
  parte de una serie de publicaciones que haré referentes a olores del código.

Funciones
--------------------------------------------------------------------------------

  1.__Muchos argumentos__, las funciones son mejores cuantos menos argumentos
  tengan. Lo ideal es que no tengan ninguno y como máximo tres, a partir de tres
  deberías cuestionarte si los argumentos no son realmente un objeto con esas
  características, por ejemplo.
  
  2.__Argumentos de salida__, los argumentos como salida no son intuitivos. Al
  usar una función se entiende que los argumentos son parámetros de entrada y
  la salida la devolveremos al terminar la ejecución con el `return`.
  
  3.__Argumentos bandera__, los argumentos *boolean* para indicar a la función
  el tipo de comportamiento que tiene que hacer son confusos. Si una función
  puede hacer más de una cosa, sepárala en dos funciones independientes.
  
  4.__Funciones muertas__, funciones que nunca son usadas no tienes porqué
  tenerlas. No guardes código viejo inútil, bórralo. Tu sistema de control de
  versiones lo recordará por ti!
  

Nombres
--------------------------------------------------------------------------------

  1.__Escoge nombres descriptivos__, los buenos nombres son el 90% de la
  legibilidad del código. Darle un buen nombre a una función, a una variable o
  a una clase no es algo trivial. Esta es de las partes más difíciles, los
  buenos nombres requieren de pensarlos con calma. No dejes nombres como `i`, `j`
  o `aux`. Los dos primeros casos si lo usas en un índice de un bucle, se podría
  pero porque esta variable `i` no abarca más de las tres líneas del bucle. Si
  se tratara de un índice global, no lo hagas!
  
  2.__Escoge nombres con un nivel de abstracción adecuado__, al escoger nombre
  ten en cuenta en el nivel en el que te encuentras y mantén siempre el mismo.
  Si estás, por ejemplo, con una interfaz módem con varias funciones como la
  siguiente.
````````````````````````````````````````````````````````````````````````````````
public interface Modem {
    boolean dial(String phoneNumber);
    boolean disconect();
    boolean send();
    String getConnectedPhoneNumber();
}
````````````````````````````````````````````````````````````````````````````````
  De primeras puede parecer que está correcta pero realmente ¿nos interesa saber
  que está implementada con un número de teléfono? Dentro de un tiempo si
  queremos usar otro tipo de localizador ¿como lo hacemos? Es por ello que sería
  mejor si lo hiciéramos de la siguiente forma.
````````````````````````````````````````````````````````````````````````````````
public interface Modem {
    boolean connect(String connectionLocator);
    boolean disconect();
    boolean send();
    String getConnectedLocator();
}
````````````````````````````````````````````````````````````````````````````````
  
  3.__Usa la nomenclatura standar, donde sea posible__, cuando estás
  implementando un patrón es probable que este tenga una nomenclatura
  estandarizada para dar nombres a ciertas partes de la aplicación como pueden
  ser las funciones, métodos o las clases. Sigue el estándar todo lo posible de
  esta forma no generas confusiones. Por ejemplo si tienes un método que
  transforma tu objeto a `String`, en Java, se usa `toString()`. Otro ejemplo
  son las funciones que puedes ver en los condicionales `if()`, estas suelen
  empezar por `is`. Quedando de esta forma `if(isFromSpain(phoneNumber))`.
  
  4.__Nombres no ambiguos__, tienes que escoger un nombre que no se quede corto
  y deje esconder parte de la tarea que realiza una función. Si tienes una
  función que se llama `rename()` e internamente, cambia el nombre y añade un
  prefijo, te estás quedando corto. Un mejor nombre sería
  `renameAndAddPrefix()`.
  
  5.__Usa nombres largos para ámbitos largos__, después tanto hablar de dar
  nombres descriptivos puedes llegar al extremo de dar nombres largos a
  variables contadoras en los iteradores. Como te he dicho en el apartado
  anterior si el ámbito del índice es solamente dentro del iterador `for` no
  hace falta que lo llames `numberCounter` si tienes dos líneas de código dentro
  y se ve que solamente se usa como iterador.
  
  6.__Evita codificar__, a día de hoy los IDEs que tenemos son potentes, nos
  ayudan con los nombres, nos avisan si hay duplicados, si no usamos una
  variable. No tenemos que comenzar por `l_` para indicar que la variable es
  local, ni nada parecido los IDEs nos lo indican.
  
  7.__Los nombres deben ser descriptivos, sin efectos secundarios__, los nombres
  tienen que ser sinceros. No puedes tener una función
  
````````````````````````````````````````````````````````````````````````````````
public getTimer(){
    if(localTimer == null){
        localTimer = new Timer():
    }
    return localTimer;
}
````````````````````````````````````````````````````````````````````````````````

  Si nos fijamos esta función no devuelve un `timer` lo que hace realmente es
  crear uno si no existe ya y luego lo devuelve. Un posible nombre más correcto
  para la función podría ser `createIfNotExistsAndReturnTimer`.

Referencias
--------------------------------------------------------------------------------

* [Libro original] sobre Clean Code, esta publicación corresponde con el
capítulo 17.

<!------------------------------ All links here -------------------------------> 

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413

