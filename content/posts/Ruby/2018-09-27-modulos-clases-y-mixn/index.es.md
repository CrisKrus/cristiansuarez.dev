---
title: "Módulos clases y mixn"
slug: "modulos-clases-y-mixn"
date: 2018-09-27T09:01:14.385Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---


Módulos, clases y mixin
================================================================================

  Las clases son objetos.

  Los módulos son librerías. Estos proveen métodos que se pueden usar en
  diferentes clases.


|      | Class           | Module         |
| :------------- | :-------------  | :------------- |
| *instantiation*  | puede ser instanciado | __NO__ puede ser instanciado |
| *usage*          | crear __objetos__ | facilidad para el __mixin__, te provee un namespace |
| *superclass*     | module          |      object    |
| *methods*        | métodos de clase y métodos de instancia | métodos de módulo y métodos de instancia |
| *inheritance*    | hereda el comportamiento y puede ser la base de la herencia | __NO__ herencia |
| *inclusion*      | __NO__ puede ser incluido | puede ser incluido en clases y módulos usando el comando include (incluye todos los métodos de instancia como métodos instancia en una clase/módulo) |
| *extension*      | __NO__ puede ser extendido con el comando __extend__ (solo con __herencia__) | puede extender la instancia usando el comando extend (extiende la instancia dada con métodos singleton del módulo (module)) |


Mixins
--------------------------------------------------------------------------------

  Si incluyes con el `mixin` un módulo en una clase, puedes hacer uso de todos
  los métodos del módulo en __una instancia__ de la clase.

````````````````````````````````````````````````````````````````````````````````
module Debug
  def whoAmI?
    "#{self.type.name} (\##{self.id}): #{self.to_s}"
  end
end

class Phonograph
  include Debug
  # ...
end

class EightTrack
  include Debug
  # ...
end

phono = Phonograph.new("West End Blues")
track = EightTrack.new("Surrealistic Pillow")

phono.whoAmI?  → "Phonograph (#537766170): West End Blues"
track.whoAmI?  → "EightTrack (#537765860): Surrealistic Pillow"
````````````````````````````````````````````````````````````````````````````````

  En caso de que el módulo esté en un fichero a parte tienes que usar el
  `require` en el inicio del fichero donde lo importas con la dirección hasta el
  fichero. Al incluir un módulo no estás haciendo una copia de los métodos
  instancia, estás copiando una referencia al métodos. De esta forma si
  modificas el módulo todas las clases que incluyen el módulo verán reflejadas
  el cambio, incluso en caliente.

[module-mixin]: http://phrogz.net/programmingruby/tut_modules.html#mixins
[classes]: http://phrogz.net/programmingruby/classes.html

Extendiendo objetos
--------------------------------------------------------------------------------

  Se pueden mezclar un objeto con un módulo usando `extend`

````````````````````````````````````````````````````````````````````````````````
module Humor
  def tickle
    "hee, hee!"
  end
end

a = "Grouchy"
a.extend Humor
a.tickle → "hee, hee!"
````````````````````````````````````````````````````````````````````````````````

  Si extiendes en una clase los métodos pasan a ser __métodos de clase__.

````````````````````````````````````````````````````````````````````````````````
module Humor
  def tickle
    "hee, hee!"
  end
end

class Grouchy
  extend  Humor
end

Grouchy.tickle → "hee, hee!"
````````````````````````````````````````````````````````````````````````````````

[classes-extend-objects]: http://phrogz.net/programmingruby/classes.html#extendingobjects

<!-- TODO -->
[class-and-module-definition]: http://phrogz.net/programmingruby/classes.html#classandmoduledefinitions

