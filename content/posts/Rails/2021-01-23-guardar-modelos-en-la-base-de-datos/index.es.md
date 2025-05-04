---
title: "Guardar modelos en la base de datos"
slug: "guardar-modelos-en-la-base-de-datos"
date: 2021-01-23T09:01:14.384Z
draft: false
hideLastModified: false
summary: ""
categories: [rails]
---


  `.save` devuelve `true` o `false` dependiendo de si se ejecutó correctamente o
  no la sentencia.

  `.save!` lanza un error si no puede completar la sentencia.

```ruby
User.new(name: 'Pepe', location: 'ES').save!
```

```ruby
User.new(name: 'Pepe', location: 'ES').save
```

  es equivalente

```ruby
User.create(name: 'Pepe', location: 'ES')
```

[post-save]: https://stackoverflow.com/a/27421738/5732392

[post-create]: https://stackoverflow.com/a/15290001/5732392

