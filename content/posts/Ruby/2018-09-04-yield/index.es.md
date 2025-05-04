---
title: "Yield"
slug: "yield"
date: 2018-09-03T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ruby]
---

<!-- DONE -->
Yield
================================================================================

  > Artículo completo en [ruby-doc.org][ruby-doc.org-yield]

  [ruby-doc.org-yield]: https://ruby-doc.org/docs/Einfuhrung_in_Ruby/chp_04/iterators.html

  Una sentencia `yield` es similar a un *callback* en JavaScript. Defines un
  bloque de código y lo pasas como argumento de un método, este segundo que lo
  recibe lo ejecuta internamente donde quiere mediante el uso de `yield`. Como
  se verá en el ejemplo siguiente defines tu método y luego a este le envías un
  bloque de código que dentro ejecutas dos veces.

```ruby
def twice
  yield
  yield
end

twice {puts("Hello World!")}

# Hello World!
# Hello World!
```

  Además se le pueden pasar parámetros, si lo quisiéramos. En este segundo
  ejemplo como se trata de un bloque de código de varias líneas lo hacemos con
  `do end` en lugar de usar las llaves `{ }`. Para indicarle los parámetros
  usamos las barras verticales `| parametro |`.

```ruby
def names
  yield("Joe")
  yield("Sandy")
  yield("Melissa")
end

names do |name|
  puts "Hello " + name + ", how are you?"
end

# Hello Joe, how are you?  
# Hello Sandy, how are you?
# Hello Melissa, how are you?
```

