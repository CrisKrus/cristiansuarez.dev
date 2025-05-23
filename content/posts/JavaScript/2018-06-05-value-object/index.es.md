---
title: "Value object"
slug: "javascript/value-object"
date: 2018-06-04T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [javascript]
---


  Cuando llamo al `then` devuelve una nueva promesa
  
  Patron value object, dos objetos que son el mismo tipo pero que varian en el 
  contenido [...]
  
  Si tenemos que modificar variables de estado del objeto esto no es un value 
  object, cuando esto ocurre devolvemos un objeto nuevo. Esto son objetos 
  inmutables como ejemplos tenemos los `strigns`
  
  En un `value object` un objeto es igual a otro si ambos tienen el mismo 
  contenido.
  
  Entidades y valores [...] exponer cuanto menos posible tener los menos 
  `getter` posibles, acciones en su lugar.
  
  Los valores no mutan su valor por convencion y las entidades son mutables.
  
  Las `promises` son `value object` el resultado de las operaciones con ellas 
  tendremos que guardarlo en una nueva variable o se quedara en el limbo.
  
  En cambio los objetos del DOM cuando los seleccionamos con `getElementById()`
  son mutables y el estado de estos y sus valores pueden ser modificados a lo 
  largo del tiempo.

## Arquitectura hexagonal puertos y adaptadores

  Existen objetos que son solamente para transporte de datos, objetos JSON que 
  luego serializamos para enviarlos como por ejemplo entre un cliente y un 
  servidor.
  
  ORM, herramienta con la capacidad de convertirte filas de una tabla BDD a un 
  objeto. Estos objetos son buenos para persistencia pero para la parte de la 
  lógica es muy peligroso, porque al no tener encapsulación y todo ser visible y
  accesible siempre genera dependencias más de las debidas.
  
  [anemic-domain-model-wikipedia]
  
  [anemic-domain-model-martin-fowler]
  
  [hexagonal-architecture-dzone]
  
  Los modelos de la aplicación no deben basarse en lo que usemos por ejemplo
  si nos basamos en *React.js* o *Firebase* nuestra aplicación no debe saberlo
  no debe de tener esas dependencias. Diseñas como si quisieras cambiar todo
  en algún momento, aunque ese no es el objetivo el objetivo es cambiar pequeñas
  cosas si romper nada. Que la api sea lo más independiente de la tecnología que
  se usa.
  
  Para ello encapsulamos todo en un objeto propio con una `api` cómoda que
  simplifique el uso de terceros y nos abstraiga de terceros. Se conoce como
  `wrapper` envoltorio, esto se puede hacer mucho más fácil si usamos una
  librería en lugar de un `framework` en el que te obliga a usar sus objetos
  propios.
  
  DTO, Data Transfer Object (supongo)
  
--------------------------------------------------------------------------------

Notas
--------------------------------------------------------------------------------

  Un constructor no debe tener logica de negocio, debe de ser solo para las
  asignaciones. Si tenemos que hacer alguna validacion mejor hacer un
  `object.create(...)` de manera que el usuario sepa que dentro de el existen
  calculos o logicas que pueden fallar en el momento de la creacion.
  
  __Objetos anemicos__ que no tiene ligica dentro de ellos solo `getters` y 
  `setters`
  
  Anteriormente diseñabas una base de datos con tablas y a partir de ellas se
  estructuraba el resto de la aplicación y esto era super frágil. [...]
  
  Como buscarlo: `value object opp` o `value object pattern`
  
  This is about [javaScript]
  This is about [object oriented programing]

References
--------------------------------------------------------------------------------
* [Java Script][javaScript]
* [Value Object][value object] por [Martin Fowler]
* [object oriented programing]
* [Vídeo original][video original] por [Carlos Blé][Carlos Ble]
* [C2 Wiki][wiki-c2-value-object]
* [anemic-domain-model-wikipedia]
* [anemic-domain-model-martin-fowler]

<!-- All links here --> 

[javaScript]: https://www.javascript.com/
[value object]: https://martinfowler.com/bliki/ValueObject.html
[Martin Fowler]: https://twitter.com/martinfowler
[object oriented programing]: https://en.wikipedia.org/wiki/Object-oriented_programming
[video original]: https://www.youtube.com/watch?v=h3vWBe0f1OA&feature=youtu.be
[Carlos Ble]: https://twitter.com/carlosble?lang=es
[wiki-c2-value-object]: http://wiki.c2.com/?ValueObject
[anemic-domain-model-wikipedia]: https://en.wikipedia.org/wiki/Anemic_domain_model
[anemic-domain-model-martin-fowler]: https://martinfowler.com/bliki/AnemicDomainModel.html
[hexagonal-architecture-dzone]: https://dzone.com/articles/hello-hexagonal-architecture-1
