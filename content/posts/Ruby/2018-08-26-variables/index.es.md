---
title: "Variables"
slug: "variables"
date: 2018-08-25T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---

<!-- DONE -->

Variables en las clases de Ruby
================================================================================

  Ruby permite cuatro tipos de variables:

  - Variable __local__, las variables locales son variables que están definidas
  en un método. Estas variables no están disponible fuera del método. Las
  variables locales empiezan con letra minúscula o guión bajo (\_)
  `variable_name`

````````````````````````````````````````````````````````````````````````````````
def method
  foo = Array.new
end

# foo no esta definida aqui, no existe
````````````````````````````````````````````````````````````````````````````````

  - Variables de __instancia__, están disponible en todos los métodos de
  cualquier de cualquier instancia u objeto. Esto quiere decir que las variables
  de instancia cambian de un objeto a otro. Estas variables están precedidas por
  un `@` seguidas del nombre de la variable `@variable_name`

````````````````````````````````````````````````````````````````````````````````
def method
  @foo = "Hola!"
end

puts @foo
````````````````````````````````````````````````````````````````````````````````

  - Variables de __clase__, están disponible en los diferentes objetos. Una
  variable de clase pertenece a la clase y es una característica de la clase.
  Están precedidas por `@@` seguidas del nombre de la variable `@@variable_name`

````````````````````````````````````````````````````````````````````````````````
class Foo
  @@variable = 0
  def counter
    @@variable += 1
    puts("Count: #@@variable")
  end
end

foo1 = Foo.new
foo2 = Foo.new

foo1.counter # 1
foo1.counter # 2
foo2.counter # 3
````````````````````````````````````````````````````````````````````````````````

  - Variables __globales__, están disponible en todas las diferentes clases. Se
  definen con `$` seguido del nombre de la variable `$variable_name`

````````````````````````````````````````````````````````````````````````````````
class Foo
  $global_variable = "Global"
end

class Any
  def method
    puts($global_variable)
  end
end

any = Any.new
any.method # "Global"
````````````````````````````````````````````````````````````````````````````````

  Las variables creadas con `@` crean instancias de variables en cada objeto,
  esto puede generar problemas si creamos dos módulos que tengan el mismo nombre
  en algunas variables, estas entrarán en colisión.

````````````````````````````````````````````````````````````````````````````````
module MajorScales
  def majorNum
    @numNotes = 7 if @numNotes.nil?
    @numNotes # Return 7
  end
end

module PentatonicScales
  def pentaNum
    @numNotes = 5 if @numNotes.nil?
    @numNotes # Return 5?
  end
end

class ScaleDemo
  include MajorScales
  include PentatonicScales

  def initialize
    puts majorNum # Should be 7
    puts pentaNum # Should be 5
  end

end

ScaleDemo.new
# output
# 7
# 7
````````````````````````````````````````````````````````````````````````````````

  Como podemos ver tanto en `MajorScales` como en `PentatonicScales` hemos
  creado una variable con el mismo nombre lo que hace que en nuestra nueva clase
  `ScaleDemo` compartan esta variable en ambos, de manera que tienen el mismo
  valor ambas.

  Ejemplo completo en [phrogz][instance-mixin-variable]

  [instance-mixin-variable]:
  http://phrogz.net/programmingruby/tut_modules.html#instancevariablesinmixins


  Más infromación sobre variables en [tutorialspoint][ruby-variables-in-classes]

  [ruby-variables-in-classes]:
  https://www.tutorialspoint.com/ruby/ruby_classes.htm

  Más información sobre clases en [tutorialspoint][class-variable]

  [class-variable]:
  https://www.tutorialspoint.com/ruby/ruby_variables.htm

