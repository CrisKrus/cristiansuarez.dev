---
title: "Curiosidades de ruby parte 2"
slug: "curiosidades-de-ruby-parte-2"
date: 2018-09-23T09:01:14.385Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---

<!-- TODO: put on meta-description witch topics I told here  -->

Métodos de clase
================================================================================

  Si queremos tener métodos que son independientes del objeto podemos hacerlos
  con métodos de clase.

```ruby
class Foo
  def self.class_method
    true
  end
end
```

  Estos métodos se llaman directamente desde la clase y no desde el objeto
  `Foo.class_method`

Re-Raising exceptions
================================================================================

  > Articulo original [ruby-doc.org][ruby-doc.org-raise]

  [ruby-doc.org-raise]: https://ruby-doc.org/core-2.2.0/RuntimeError.html

  Con la sentencia `raise` lanzas una excepción con el mensaje que le pasemos
  por parámetro.

```ruby
raise "ouch"
```

  De esta manera nos llegará una excepción de esta forma.

```ruby
RuntimeError: ouch
```

```ruby
rescue HatchError => err
  puts $!.message
  raise
end
```

Variables globales
================================================================================

  > Documentación completa en [ruby-doc.org][ruby-doc.org-global-vars]

  [ruby-doc.org-global-vars]:
  https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/globalvars.html

```
$! 	último mensaje de error
$@ 	ubicación del error
$_ 	útlimo string leido por gets
$. 	último número de línea leido por el interprete
$& 	último sring matched por una expresión regular
$~ 	la última expresión regular que hizo match, como un array de sub-expresiones
$n 	las n sub-expresiones en el último match (igual que $~[n])
$= 	case-insensitivity flag
$/ 	input record separator
$\ 	output record separator
$0 	the name of the ruby script file
$* 	the command line arguments
$$ 	interpreter's process ID
$? 	exit status of last executed child process
```

  > Extracto sacado de [gist][dollar-gist].

  [dollar-gist]: https://gist.github.com/dvliman/10402435

```
$: (Dollar Colon) is basically a shorthand version of $LOAD_PATH. $: contains an array of paths that your script will search through when using require.
$0 (Dollar Zero) contains the name of the ruby program being run. This is typically the script name.
$* (Dollar Splat) is basically shorthand for ARGV. $* contains the command line arguments that were passed to the script.
$? (Dollar Question Mark) returns the exit status of the last child process to finish.
$$ (Dollar Dollar) returns the process number of the program currently being ran.
$~ (Dollar Tilde) contains the MatchData from the previous successful pattern match.
$1, $2, $3, $4 etc represent the content of the previous successful pattern match.
$& (Dollar Ampersand) contains the matched string from the previous successful pattern match.
$+ (Dollar Plus) contains the last match from the previous successful pattern match.
$` (Dollar Backtick) contains the string before the actual matched string of the previous successful pattern match.
$’ (Dollar Apostrophe) contains the string after the actual matched string of the previous successful pattern match.
$! (Dollar Bang) contains the Exception that was passed to raise.
$@ (Dollar At Symbol) contains the backtrace for the last Exception raised.
````

Tipos de datos
================================================================================

  > Más información en el curso completo de
  [Pluralsight][pluralsight-ruby-fundamentals]

  [pluralsight-ruby-fundamentals]:
  https://app.pluralsight.com/library/courses/ruby-fundamentals/table-of-contents


  No existe el __true__ y el __false__ son instacia de la clase `TrueClass` y
  `FalseClass` por lo tanto son objetos.

  Los números se pueden separar por guiones bajos ruby los ignora. De tal manera
  que para el es lo mismo `100_000_000` que `100000000`.


<!-- TODO this link is not referenced anywhere -->
[ruby-testing-focus]: https://relishapp.com/rspec/rspec-core/v/2-3/docs/command-line/tag-option

