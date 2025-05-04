---
title: "Constantes"
slug: "ruby/constantes"
date: 2018-08-27T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ruby]
---

<!-- DONE -->


  Las constantes se definen escribiendo la primera letra en mayúsculas, pero
  normalmente se escriben todas ellas. Si despues de definir esta constante
  tratas de modificarla te salta un aviso de que estás modificando una
  constante.

````````````````````````````````````````````````````````````````````````````````
  MAX_SPEED = 100
  MAX_SPEED = 1000
  # warning: already initialized constant MAX_SPEED
  # warning: previous definition of MAX_SPEED was here
````````````````````````````````````````````````````````````````````````````````

  En cambio si la constante es un objeto y tratas de modificarlo no
  dice nada (dado que está guardando la referencia a memoria), para poder evitar
  que nos modifiquen una constante objeto existe el método `freeze`. De tal
  manera que si creamos un array por ejemplo podemos inicializarlo y evitar que
  lo modifiquen la consante pero no el objeto que tenga dentro.

````````````````````````````````````````````````````````````````````````````````
TYPES = []
TYPES << "freighter"
# can be modified

TYPES.freeze
TYPES << "freighter"
# RuntimeError: can't modify frozen Array

TYPES[0].upcase!
# FREIGHTER
````````````````````````````````````````````````````````````````````````````````

