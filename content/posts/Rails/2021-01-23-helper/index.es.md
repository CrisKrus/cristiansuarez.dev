---
title: "Helper"
slug: "rails/helper"
date: 2021-01-23T09:01:14.383Z
draft: false
hideLastModified: false
summary: ""
categories: [rails]
---

Helpers
================================================================================

  Supongamos que tienes guardado en sesión el correo del usuario actual (una
  cookie) y que quieres acceder a ella en varias vistas de la aplicación. Para
  ello tendrías que hacer algo similar a `session[:current_user_email]` en cada
  una de las vistas donde hiciera falta.

  Rails te permite simplificar y unificar esto, para ello solamente tendrás que
  crear un *helper*, si nos dirigimos a al directorio `/app/helpers` dentro del 
  fichero `application_helper.rb` podemos crear una función de la siguiente forma.

```ruby
module ApplicationHelper

  def current_user_email
    session[:current_user_email]
  end

end
```

  Ahora cada vez que queramos acceder al correo del usuario actual en la
  aplicación basta con llamar a esta función, de manera que siempre actuará de
  igual forma. Además, si en el futuro queremos cambiar la implementación y
  acceder de otra manera vendremos a esta función y cambiaremos la
  implementación.

