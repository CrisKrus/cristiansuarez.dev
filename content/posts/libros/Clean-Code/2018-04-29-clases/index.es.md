---
title: "Clases"
slug: "libros/clases"
date: 2018-04-28T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
tags: [clean-code, buenas-prácticas, oop, diseño]
---


  Hasta ahora hemos visto como escribir de la mejor manera posible lineas y
  bloques de código, pero aun no hemos visto como  hacerlo con las clases.

Ordenar los métodos
--------------------------------------------------------------------------------

  A la hora de organizar las clases es importante que si tenemos un método que
  hace uso de otro que tenemos en nuestra clase, es mejor si lo ponemos a
  continuación, de manera que si estamos leyendo el código no tengamos que dar
  saltos en él y sea lo más parecido a un artículo.

Modificadores
--------------------------------------------------------------------------------

  Nuestras variables, métodos o funcionalidades deben tener el **modificador más
  restrictivo** posible, si tenemos que acceder a un método en un test y no
  podemos por ser privado lo pondremos como **protected**, de manera que será
  accesible desde el mismo paquete.
  
  Principio de responsabilidad única

  Un punto importante a la hora de desarrollar un clase es el tamaño porque, el
  tamaño si importa, al igual que con lo métodos las clases tienen que ser lo
  más pequeñas posibles y en lo que a dimensiones se refiere no hay un máximo de
  líneas. En su lugar lo que hay que tener en cuenta es el **número de
  responsabilidades**, una clase no debe tener más de una responsabilidad si se
  te pasa por la cabeza añadirle otra (consejo, probablemente esto sea una nueva
  clase). Y esto el  principio más importante en la **O**rientación a 
  **O**bjetos, el **principio de responsabilidad única** ([SRP]) y en resumidas
  cuentas dice que una clase debe tener un solo cometido, de manera que si 
  cambia sea por una única razón. Evitando entremezclar términos de lógica de
  negocio, con persistencia, con interfaz de usuario.

Cohesión
--------------------------------------------------------------------------------

  Es importante que las clases tengan el menor número posible de instancias de
  variables y además, para lograr mayor cohesión  estas variables tienen que ser
  accedidas por el mayor número de métodos de la clase. **Se dice que una clase
  es cohesiva cuando cada método de esta accede a cada variable instanciada**.
  En general es complicado alcanzar estos niveles de cohesión. Por ejemplo la
  siguiente clase tiene un nivel de cohesión bastante elevado.

  ``````````````````````````````````````````````````````````````````````````````  
  public class Stack {
      private int topOfStack = 0;
      List<Integer> elements = new LinkedList<Integer>();
  
      public int size() {
          return topOfStack;
      }
  
      public void push(int element) {
          topOfStack++;
          elements.add(element);
      }
  
      public int pop() throws PoppedWhenEmpty {
          if (topOfStack == 0)
              throw new PoppedWhenEmpty();
          int element = elements.get(--topOfStack);
          elements.remove(topOfStack);
          return element;
      }
  }
  ``````````````````````````````````````````````````````````````````````````````

  Como se ve tienen tan solo dos variables instanciadas y sólo en un método no
  se accede a ambas (size).

[Libro original]
--------------------------------------------------------------------------------

[SRP]: https://es.wikipedia.org/wiki/Principio_de_responsabilidad_%C3%BAnica
[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
