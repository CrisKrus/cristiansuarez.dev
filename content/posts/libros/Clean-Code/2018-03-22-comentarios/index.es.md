---
title: "Comentarios"
slug: "libros/comentarios"
date: 2018-03-22T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [libros, clean code]
---

Comentarios
================================================================================

  Comentarios, un buen comentario puede ser muy útil, puede ser la mejor ayuda
  que encontraste ese día pero, por otra parte pueden ser tan dañinos y malvados
  que ni el mismo autor de ellos sabrá porque están ahí. La mala noticia es que
  la mayoría de las veces los comentarios entran en este segundo grupo.

Malos comentarios
--------------------------------------------------------------------------------

### No arreglan mal código

  Se supone que cuando dejamos un comentario lo hacemos para suplir alguna
  carencia que tenemos en el código así que primer consejo, **no maquilles mal
  código con comentarios**. Si unas líneas de tu código no hacen lo que dicen,
  no están nombradas como deberían o no tienen sentido que estén ahí, no les
  añadas un comentario aclaratorio no es la solución.

### No explican que estás haciendo

  Si estás ante una condición como esta

  ``````````````````````````````````````````````````````````````````````````````
  // Comprobar si el empleado puede ser seleccionado para jubilarse
  if ((empleado.señal & SEÑAL) && (empleado.edad > 65))
  ``````````````````````````````````````````````````````````````````````````````

  ¿Porque no intentas darle la vuelta a esto y hacer un código auto explicativo?

  ``````````````````````````````````````````````````````````````````````````````
  if (empleado.estaPreparadoParaLaJubulación())
  ``````````````````````````````````````````````````````````````````````````````

### No son redundantes

  Si tienes unas líneas que se explican por si solas no dejes un comentario que
  explican exactamente lo mismo.

  ``````````````````````````````````````````````````````````````````````````````
  // Si está cerrado devuelve la hora de apertura
  if(cerrado){
      return new HorarioApertura();
  }
  ``````````````````````````````````````````````````````````````````````````````

  Tampoco hagas esto, creo que sobra explicar porqué.

  ``````````````````````````````````````````````````````````````````````````````
  /**
  *
  * @param titulo El titulo del CD
  * @param autor El autor del CD
  * @param año El año del CD
  */
  public CD(String titulo, String autor, String año){
      ...
  }
  ``````````````````````````````````````````````````````````````````````````````

### No engañan

  No dejes comentarios que engañan al lector, no escribas diciendo que este
  método devuelve verdadero cuando la tienda está cerrada y luego si miras la
  implementación realmente lo que hace es mirar si está cerrada y en caso de
  que no lo esté espera un tiempo para realizar una segunda comprobación.
  Porque con esto solo logras que al usar esta función no obtengas los
  resultados esperados.

### Deben aportar algo

  Si escribes un comentario para explicar algo que no tiene razón de ser
  explicado, sobra no dejes ese comentario no expliques que esta variable que
  estás declarando es privada si delante de ella tienes puesto _private_, no
  dejes un comentario sobre un constructor por defecto diciendo "_este es el
  constructor por defecto_". ¿Que pretendes lograr con todo esto? Yo te digo lo
  que logras con todo ello, logras generar ruido en el código. Con ruido me
  refiero a líneas de código que no tienen razón de estar ahí que entorpecen a
  los demás a la hora de leer.
  
### No cierran funciones

  En los inicios de la programación, estos tenían algo de sentido pero a día de
  hoy no tienen razón de ser. Si no sabes de lo que te hablo mejor, no los has
  tenido que ver significa de algún modo todo que estamos por el buen camino. Me
  refiero a lo siguiente.

  ``````````````````````````````````````````````````````````````````````````````
  while(condición()){
      if(comprobación()){
          for(){
          ...
          } //for
          ...
      } //if
  } //while
  ``````````````````````````````````````````````````````````````````````````````

  A día de hoy con los IDEs que tenemos que nos marcan con colores donde cierra
  cada llave, nos permiten colapsar las líneas que tiene dentro incluso, no hay
  razón válida para que esto siga existiendo.

### No son código no válido

  No comentes código que ha dejado de servir, que ya no funciona o incluso nunca
  ha llegado a funcionar. Si ese código ya no lo usas ¿para que lo "guardas"? En
  serio crees que en algún momento haciendo construyendo otra clase, dirás
  "cónchale voy a rescatar este trozo que dejé comentado, que no tiene nada que
  ver" porque te aviso ya, que esto no ocurre. Es más si ya se te ha ocurrido la
  solución una vez, se te ocurrirá una segunda y de manera más rápida, en serio
  no comentes código porque te costó mucho trabajo llegar a él o porque "me será
  útil luego".

Buenos comentarios
--------------------------------------------------------------------------------

  Existen circunstancias, como ya he comentado, donde un comentario puede ser de
  gran ayuda. Aunque bajo mi punto de vista siguen siendo un arma de doble filo,
  explicaré al final porqué.

### Comentarios legales

  Comentarios que por la razón legal que sea tienen que estar escritos, con el
  autor, el año, empresa, etc.

### Comentarios informativos

  Comentarios que información básica de alguna sentencia compleja. Una expresión
  regular por ejemplo, puede estar bien explicar de manera rápida y básica que
  comprueba, aunque siempre se puede extraer a una clase que se encarga de estas
  comprobaciones, de forma que este comentario no haga falta.

### Explicar la intención

  Si has solucionado un problema no de la mejor forma, puedes indicar que lo has
  hecho así con un porqué.

### Comentarios aclaratorios

  En caso de que estés usando una librería que los valores que devuelve no
  corresponden con resultados legibles, puede estar bien un comentario a final
  de la línea explicando porque ese 1 que devuelve si es mayor que nuestro valor
  indica que debemos sumar dos valores.

### Javadocs

  Si estás creando una API pública es casi obligatorio dejar estos comentarios
  siguiendo el formato.

### TODO

  Estos comentarios están estandarizados y representan problemas que como
  programador no puedes solucionar en este momento o porque no quieres dejar lo
  que estás haciendo y dejas esta nota para volver en un futuro. Además al estar
  estandarizados los IDEs potentes en la actualidad son capaces de encontrarlos
  por nuestro proyecto y mostrarnos una lista con todos ellos.

[Libro original]
--------------------------------------------------------------------------------

[Libro original]: https://leer.amazon.es/kp/embed?asin=B001GSTOAM&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_bopYAb3Y71AX3&tag=5413
