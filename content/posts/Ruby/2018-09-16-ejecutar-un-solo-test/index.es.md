---
title: "Ejecutar un solo test"
slug: "ruby/ejecutar-un-solo-test"
date: 2018-09-15T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ruby]
---

<!-- DONE -->

Ejecutar solo un test
================================================================================

  En nuestros test podemos definir etiquetas, si queremos ejecutar un solo test
  podemos definir una que sea `:focus` de manera que en el test que queramos
  que se ejecute hacemos `:focus => true`

```ruby
describe "group with tagged specs" do
  it "example I'm working now", :focus => true do; end
  it "special example", :type => 'special' do; end
  it "slow example", :skip => true do; end
  it "ordinary example", :speed => 'slow' do; end
  it "untagged example" do; end
end
```

  Si ahora cuando ejecutamos nuestros test hacemos `rspec . --tag focus` nos
  ejecutara solamente el test con el `:focus => true` en nuestro caso el primero
  solamente. Si hacemos `rspec . --tag type:special` en ese caso solo nos
  ejecutara el segundo test.

  Para este ejemplo estamos usando [rspec] toda la documentación sobre etiquetas
  [aquí][rspec-tag-option]

[rspec]: http://rspec.info/
[rspec-tag-option]: https://relishapp.com/rspec/rspec-core/v/2-3/docs/command-line/tag-option

