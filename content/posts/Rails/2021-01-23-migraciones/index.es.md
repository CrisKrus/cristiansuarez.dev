---
title: "Migraciones"
slug: "migraciones"
date: 2021-01-23T09:01:14.383Z
draft: false
hideLastModified: false
summary: ""
categories: [rails]
---


  `rails generate migration` no soporta valores por defecto, si queremos uso de
  ello tendremos que hacerlo a mano ya que __Rails__ si que lo soporta.

  Una vez nos genere la migracion, por ejemplo que tipo de formulario usa una
  pregunta (selección única, múltiple, completar, etc)

```ruby
class AddFormTypeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :formType, :string
  end
end
```

  Nosotros le tendremos que añadir el valor por defecto que queremos antes de
  ejecutar la migración con `rails db:migrate`

```ruby
add_column :questions, :formType, :string, :default => 'radio'
```

[post-default]: https://stackoverflow.com/a/6168127/5732392

