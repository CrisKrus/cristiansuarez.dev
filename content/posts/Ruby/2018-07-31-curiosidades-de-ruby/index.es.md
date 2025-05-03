---
title: "Curiosidades de ruby"
slug: "curiosidades-de-ruby"
date: 2018-07-30T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---

<!-- TODO: put on meta-description witch topics I told here  -->

Manejo de array
================================================================================

  Para acceder a los arrays podemos hacerlo de varias formas, una de ellas es
  mediante los corchetes. Estos son muy flexibles, podemos hacer muchas cosas
  con ellos. Podemos acceder con
  - `[0..2]` elementos desde 0 hasta 2 `[0], [1], [2]`
  - `[0, 2]` 2 elementos desde el 0 `[0], [1]`
  - `[-1]` el último elemento
  - `[0..2] = 'A'` elementos desde el 0 hasta el 2 sustituye por 'A' deja __un
  solo__ elemento, une los tres seleccionados en uno solo

````````````````````````````````````````````````````````````````````````````````
a = Array.new
a[4] = "4";                 #=> [nil, nil, nil, nil, "4"]
a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "4"]
a[1..2] = [ 1, 2 ]          #=> ["a", 1, 2, nil, "4"]
a[0, 2] = "?"               #=> ["?", 2, nil, "4"]
a[0..2] = "A"               #=> ["A", "4"]
a[-1]   = "Z"               #=> ["A", "Z"]
a[1..-1] = nil              #=> ["A", nil]
a[1..-1] = []               #=> ["A"]
a[0, 0] = [ 1, 2 ]          #=> [1, 2, "A"]
a[3, 0] = "B"               #=> [1, 2, "A", "B"]
````````````````````````````````````````````````````````````````````````````````

Diferencia entre dup & clone
================================================================================

  > Articulo completo en [coderwall].

  Ambos métodos crean una copia superficial (*shalow copy*), lo que quiere decir
  que hace una __copia directa__ de los campos que el objeto tenga dentro. Por
  lo tanto si tiene __primitivos__ los copia y si tiene __objetos__ copia la
  __referencia__ a la zona de memoria, con lo que si modificamos un campo de la
  copia el cual es un __objeto__ modificara el valor del original.

````````````````````````````````````````````````````````````````````````````````
items = [
  Item.new('irrelevant'),
  Item.new('irrelevant'),
  Item.new('irrelevant')
]
cart = ShoppingCart.new(items)
clone = cart.clone

puts cart     #<ShoppingCart:0x000055d2f0d41bb0>
puts clone    #<ShoppingCart:0x000055d2f0a421d0>

puts cart.getList.size    #3

clone.delete 1
puts clone.getList.size   #2
puts cart.getList.size    #2
````````````````````````````````````````````````````````````````````````````````

  La diferencia entre ambos es que __clone__ hace dos cosas que no hace __dup__
  estas son:

  - Copia la clase *singleton* del objeto copiado
  - Mantiene el estado congelado del objeto copiado

````````````````````````````````````````````````````````````````````````````````
a = Object.new      # creamos la instacia del objeto

def a.foo; :foo end # le incluimos un método nuevo

p a.foo   # => :foo # vemos que el método existe

b = a.dup           # hacemos la copia
p b.foo   # => undefined method `foo' for #<Object:0x007f8bc395ff00> (NoMethodError)
                    # el método nuevo no existe en la copia con dup
b = a.clone
p b.foo   # => :foo
                    # el método nuevo si existe en la copia con clone
````````````````````````````````````````````````````````````````````````````````

  Estado congelado:

````````````````````````````````````````````````````````````````````````````````
a = Object.new
a.freeze

p a.frozen?   # => true

b = a.dup
p b.frozen?   # => false

c = a.clone
p c.frozen?   # => true
````````````````````````````````````````````````````````````````````````````````

  Como podemos ver el estado se mantiene si usamos el __clone__.

for VS each
================================================================================

  > Artículo completo en [freecodecamp-leandrotk] por [LeandroTK] en el apartado
  > de *Looping/Iterator*.

  En el ejemplo siguiente veremos porque nos recomiendan que usemos __each__ en
  lugar de __for__, esto es debido a que el bucle foor una vez termina su
  ejecución mantiene la variable que usa para iterar. En cambio esto no ocurre
  si usamos un iterador __each__.

````````````````````````````````````````````````````````````````````````````````
# for looping
for num in 1...5
  puts num
end

puts num # => 5

# each iterator
[1, 2, 3, 4, 5].each do |num|
  puts num
end

puts num # => undefined local variable or method `n' for main:Object (NameError)
````````````````````````````````````````````````````````````````````````````````

Objetos
================================================================================

  En ruby no tenemos porque declarar los campos de un objeto, basta con
  incluirlos con un `@`. Estos campos por defecto no son accesibles desde fuera,
  para decirdir el nivel de acceso que le queremos dar existen tres etiquetas:

  - `attr_accesor`, permites lectura y escritura en el campo
  - `attr_reader`, permites lectura en el campo
  - `attr_writter`, permites escritura en el campo

  Para usarlo sería de la siguiente forma.

````````````````````````````````````````````````````````````````````````````````
class Item
  attr_reader :price
  attr_accessor :amount
  attr_writer :name

  def initialize(name, amount, price, foo)
    @name = name
    @amount = amount
    @price = price
    @foo = foo
  end
end
````````````````````````````````````````````````````````````````````````````````

  De esta forma `price` solo se puede leer, `amount` permite lectura y
  escritura, `name` solo escritura y al campo `foo` no se puede acceder.

````````````````````````````````````````````````````````````````````````````````
item = Item.new('raton', 15, 40, 'foo')

puts item.price     # 40
puts item.amount    # 15
puts item.name      # Error
puts item.foo       # Error

item.amount = 10
puts item.amount    # 10

item.name = 'teclado' # se modifica el valor a teclado

````````````````````````````````````````````````````````````````````````````````

Múltiples campos en un método
================================================================================

  > Articulo completo en [codementor] punto 3

  En caso de tener un método con una cantidad de campos indefinidos existe un
  operador __\*__

````````````````````````````````````````````````````````````````````````````````
def mood(name, *feelings)
  feelings.each do |feeling|
    puts "#{name} is feeling #{feeling} today."
  end
end

feeling("Suzie", "happy", "excited", "nervous")
# Suzie is feeling happy today.
# Suzie is feeling excited today.
# Suzie is feeling nervous today.
````````````````````````````````````````````````````````````````````````````````

Usar doble exclamación (!!) para comprobar si existe un valor
================================================================================

  > Articulo completo en [codementor] punto 5

  Puede sonar raro, usar una doble negación? No se supone que se anulan al
  usarla. Esto es un truco que se usa en ruby para evitar que nos devuelvan
  `nil`. Si devolvemos directamente un valor que esperamos que sea verdadero o
  falso, puede darse el caso de que este no esté inicializado. Es por ello que
  si devolvemos una doble negación, con la primera obtenemos verdadero en caso
  de que no exista y en la seguda negación falso, lo que nosotros queríamos.

````````````````````````````````````````````````````````````````````````````````
class Name
  attr_reader :middle_name

  def initialize(first_name, last_name, middle_name=nil)
  	@first_name = first_name
  	@middle_name = middle_name
  	@last_name = last_name
  end

  def has_middle_name?
  	!!@middle_name
  end

end

george = Name.new("George", "Washington")
george.has_middle_name?      #=> false

puts george.middle_name     # nil
puts !george.middle_name    # true
puts !!george.middle_name   # false

obama = Name.new("Barack", "Obama", "Hussein")
obama.has_middle_name?      #=> true

puts obama.middle_name      #=> "Hussein"
puts !obama.middle_name     #=> false
puts !!obama.@middle_name   #=> true
````````````````````````````````````````````````````````````````````````````````

Legibilidad
================================================================================

Métodos `true` `false`
--------------------------------------------------------------------------------

  > Articulo completo en [sitepoint]

  Por convenio en __Ruby__ los métodos que devuelvan verdadero o faso, como
  puede ser `is_empty` se terminan con un signo de interrogación para dar más
  semántica al código. De tal manera que quedan `is_empty?`.

Condiciones `if !true`
--------------------------------------------------------------------------------

  > Articulo completo en [sitepoint]

  Existe una cláusula que hace lo mismo y queda más claro (a mi parecer), además
  te recomiendan que la uses. La cláusula es `unless`

````````````````````````````````````````````````````````````````````````````````
if !true
  do_this
end

unless true
  do_this
end
````````````````````````````````````````````````````````````````````````````````

  Y __nunca__ debe de tener un `else`, se le puede poner pero no tiene sentido.
  Si tienes un `else` en un `unless` con cambiar el sentido de la condición
  queda igual.

````````````````````````````````````````````````````````````````````````````````
# NEVER do this
unless success
  #throw error
else
  #return success
end

# This is the correct form
if success
  #return success
else
  #throw error
end
````````````````````````````````````````````````````````````````````````````````

<!------------------------------ All links here ------------------------------->

[coderwall]: https://coderwall.com/p/1zflyg/ruby-the-differences-between-dup-clone
[freecodecamp-leandrotk]: https://medium.freecodecamp.org/learning-ruby-from-zero-to-hero-90ad4eecc82d
[LeandroTK]: https://twitter.com/leandrotk_
[codementor]: https://www.codementor.io/ruby-on-rails/tutorial/6-ruby-best-practices-beginners-should-know
[sitepoint]: https://www.sitepoint.com/10-ruby-on-rails-best-practices-3/

