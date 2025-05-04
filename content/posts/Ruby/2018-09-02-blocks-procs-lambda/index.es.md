---
title: "Blocks procs lambda"
slug: "blocks-procs-lambda"
date: 2018-09-01T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ruby]
---

<!-- DONE -->

Diferencia entre `Block`, `Proc` y `Lambda`
================================================================================

  - Los proc se crean de la siguiente forma:

```ruby
p = Proc.new {|bla| puts "I'm a proc that says #{bla}!" }
p = proc {|bla| puts "I'm a proc that says #{bla}!" }
```

  - Las lambda se crean de la siguiente forma:

```ruby
lmb = lambda {|bla| "I'm also a proc, and I say #{bla}" }
also_lmb = ->(bla) { "I'm also a proc, and I say #{bla}" }
```

Diferencias
--------------------------------------------------------------------------------

  - Procs son como __blocks__, lambdas son como __métodos anónimos__.
  - Lambdas son __estrictas__ en sus __argumentos__, si le pasas muchos o pocos
  argumentos devuelve una excepción. En el caso de blocks y procs si pasas muchos
  los ignora y si pasas pocos pone los restantes a `nil`
  - Los `return` y `break` en procs y lambdas se __comportan diferentes__. El
  return en un proc se ejecuta en el scope donde se definió el bloque. En lambdas
  return y break devuelven el control al que lo ha llamado.
  - `next` se comporta __igual__ en los tres casos.

  Usar la abreviatura de invocación de `proc`  cuando el método invocado es la
  única operación de un bloque. Ejemplo sacado de la guía de estilos [Rubocop]

  [Rubocop]: https://github.com/rubocop-hq/ruby-style-guide#single-action-blocks

```ruby
names = ["Pepe", "Juan", "Rosa", "Violeta"]

# BAD
upper_names = names.map { |name| name.upcase }
# ["PEPE", "JUAN", "ROSA", "VIOLETA"]

# GOOD
upper_names = names.map(&:upcase)
# ["PEPE", "JUAN", "ROSA", "VIOLETA"]
```

