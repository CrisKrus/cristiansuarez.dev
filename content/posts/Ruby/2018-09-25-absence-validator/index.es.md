---
title: "Absence validator"
slug: "ruby/absence-validator"
date: 2018-09-25T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ruby]
---

<!-- TODO what is the utility of this, my example of use is wrong as y mention
at the end of the post -->


  En Ruby on Rails existe un validador con el nombre de *__absence__*, este la
  primera vez que lo vi pensé *"¿Para que quiere comprobar que un valor no
  existe?"* Pero luego leyendo este [post] me ha parecido útil a la hora de
  definir campos en el modelo que se encuentran en la base de datos y esta los
  genera automáticamente. Como por ejemplo un __ID__

  [post]:
  http://blog.remarkablelabs.com/2012/12/activemodel-absence-validator-rails-4-countdown-to-2013

```ruby
class User
  include ActiveModel::Validations

  attr_accessor :id, :name

  validates :id, absence: true
end
```

  De esta forma modelamos que el usuario tiene un ID pero no puede ser impuesto
  desde el la aplicación, lo dejamos para la base de datos.

  De tal manera que si comprobamos si el objeto que hemos creado es válido o no,
  uno de los puntos que tendrá en cuenta será que tiene que tener el ID en este
  caso vacío.

```ruby
user = User.new
user.valid?
# => true
user.id = 1
user.valid?
# => false
```

  Este ejemplo no es bueno ya que el ID lo genera rails automáticamente y debe
  de estar presente siempre en la base de datos. Esto generará un problema si
  hacemos lo siguiente.

```ruby
user = User.new
user.name = 'Pepe'
user.save
# save on database
user = User.last
# id: 1 name: Pepe

user.name = 'Antonio'
user.save
# error id should be blank

user.id = nil
# error from database, id can't be null
```

  Al tener la restricción en el modelo de que el ID tiene que ser vacío en el
  momento de la creación y el primer guardado en la base de datos no hay
  problema pero si cargamos un usuario para modificarlo nos obliga la aplicación
  a que sea vacío el ID y al guardarlo en la base de datos no puede ejecutar la
  sentencia SQL.

Referencias
--------------------------------------------------------------------------------

  - Documentación oficial sobre [absence]
  - [Post][post] aclarativo en español.

[absence]: https://guides.rubyonrails.org/active_record_validations.html#absence

