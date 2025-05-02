---
title: "Test en ruby"
slug: "test-en-ruby"
date: 2018-09-08T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---

<!-- DONE -->

Test en Ruby
================================================================================

  > Artículo original en [rspec-info]

  [rspec-info]: http://rspec.info/

Instalar la gema
--------------------------------------------------------------------------------

  Primero creamos un archivo `Gemfile` en la raiz de nuestro proyecto con al
  menos el siguiente contenido

```ruby
source "https://rubygems.org"

gem 'rspec', '~> 3.0'
```

  Luego instalamos las gemas que hemos indicado en nuestro fichero `Gemfile`
  mediante

```bash
bundle install --binstubs
```

  Con todo instalado iniciamos la *suite* de test

```bash
bin/rspec --init
```

  Creamos nuestro primer test

```ruby
require 'rspec'

describe 'My first test' do
  it 'should do works fine' do
    expect(true).to be_truthy
    expect(true).to be true
  end
end
```

  Y lo ejecutamos desde la raiz del proyecto añadiendo la opción `--format doc`
  hacemos que sea mas amigable, mostrando los nombres de los test que han pasado
  en verde y los que no en rojo. Si no ponemos esta opción se mostrará una línea
  de puntos verdes y rojos para indicar los test que han pasado y los que no.

```ruby
bin/rspec --format doc
```

