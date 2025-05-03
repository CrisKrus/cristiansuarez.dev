---
title: "Filtros"
slug: "filtros"
date: 2018-08-29T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---

<!-- DONE -->

  Cuando estamos implementando nuestro controlador en Ruby es posible que en
  algunos casos tengamos que comprobar antes de cada acción (método) algo como
  por el ejemplo el caso de la sesión. Es decir, comprobar que el usuario está
  logeado para poder realizar esa acción concreta o ver las credenciales del
  mismo para comprobar si tiene permisos para ello.

  Esto se puede hacer en Ruby de manera sencilla con los filtros ([filters]).
  Siguiendo con el ejemplo anterior tendríamos que hacer algo parecido a lo
  siguiente.

  [filters]: https://guides.rubyonrails.org/action_controller_overview.html#filters

```Ruby
class ApplicationController < ActionController::Base
  before_action :require_login, only: :createItem

  def index
    #
  end

  def createItem
    #
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end
end
```

  De esta forma cada vez que que la aplicación acceda a `createItem`
  antes pasará por `require_login` comprobando que el usuario ha iniciado sesión
  antes de hacer la acción.

  Como se ve en el ejemplo también existen modificadores si quieres que solo sea
  en una acción concreta como en el ejemplo con `only:`, para que NO se ejecute
  en ciertas acciones solamente `except:`.

  Además del `before_action` existen también el `after_action` y el
  `arround_action` y como es de esperar en el *after* se ejecutará después de
  cada acción. El caso del *around* es más especial y este se ejecuta entre el
  *before* y el *after*, según he podido leer en este [post] de stackoverflow.

  [post]: https://stackoverflow.com/questions/36143039/rails-around-action-in-the-callback-stack#36143293

