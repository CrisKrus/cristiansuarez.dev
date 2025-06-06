---
title: "Validaciones presente campo false"
slug: "rails/validaciones-presente-campo-false"
date: 2021-01-23T09:01:14.384Z
draft: false
hideLastModified: false
summary: ""
categories: [rails]
---

  Si tenemos un campo booleano en nuestro modelo que queremos que sea
  obligatorio y lo intentamos hacer con `presence: true` mira lo que ocurre.


  Nuestro modelo *option* con dos campos un texto, y un *boolean* (*is_correct*)

```ruby
class Option < ApplicationRecord
  validates :text, presence: true
  validates :is_correct, presence: true
end
```

  En la base de datos las migraciones estan correctas.

```ruby
ActiveRecord::Schema.define(version: 2018_08_29_112851) do

  create_table "options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "text"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end

  end
```

  Si creamos un objeto __o2__ con todos los campos correctos y el campo
  __`is_correct`__ a `false` vemos como no es valido para Rails

```ruby
2.5.1 :111 > o2
 => #<Option id: nil, text: "Option 2", created_at: nil, updated_at: nil, is_correct: false>
2.5.1 :110 > o2.valid?
 => false
```

  Pero en cambio si este mismo objeto cambiamos la propiedad a `true` vemos como
  pasa a ser valido.

```ruby
2.5.1 :112 > o2.is_correct = true
 => true
2.5.1 :114 > o2
 => #<Option id: nil, text: "Option 2", created_at: nil, updated_at: nil, is_correct: true>
2.5.1 :113 > o2.valid?
 => true
```

  En rails para validar la presencia de un campo de tipo *boolean* tenemos que
  hacerlo de otra forma. Para ello tenemos que usar `inclusion:` de manera que
  le indicamos si contiene algunos de los valores en nuestro modelo

```ruby
class Option < ApplicationRecord
  validates :text, presence: true
  validates :is_correct, inclusion: {in: [true, false]}
end
```

  Esta inforamcion la he sacado de la documantación oficial de
  [Rails][documentation]

  [documentation]: https://github.com/rails/rails/blob/master/guides/source/active_record_validations.md#presence

