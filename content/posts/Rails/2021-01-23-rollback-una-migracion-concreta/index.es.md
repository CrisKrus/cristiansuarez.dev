---
title: "Rollback una migración concreta"
slug: "rollback-una-migracion-concreta"
date: 2021-01-23T09:01:14.383Z
draft: false
hideLastModified: false
summary: ""
categories: [rails]
---


  Si necesitamos volver al estado anterior a la última migración en la base de
  datos, deshacer los cambios rails tiene una funcionalidad para ello, típica en
  las bases de datos *rollback*

```rails
rake db:rollback STEP=1
```

  Si en lugar de deshacer una migración queremos por ejemplo deshacer 5, basta
  con indicarlo en el parámetro __STEP__

```rails
rake db:rollback STEP=5
```

  Una vez los *rollback* se completan podemos borar las migraciones que se nos
  habían generado en `/db/migration` que hemos desecho.

Rollback una migración concreta
--------------------------------------------------------------------------------

  En caso de que solo queramos deshacer una migración que se encuentra en medio
  de todas las existentes podemos hacerlo indicando en el parámetro __STEP__ el
  código de la migración que está al comienzo del fichero. Este código es la
  fecha y hora, como dato curioso.

  En este caso queremos deshacer *20180901201547*

```rails
rake db:migrate:down VERSION=20180901201547
```

  Este caso es más complicado que los anteriores, si los cambios que hemos
  deshecho afectan a las migraciones siguientes puede romper la base de datos.

  Esta información la he sacado de este [post] de StackOverflow.

[post]: https://stackoverflow.com/questions/3647685/how-to-rollback-a-specific-migration

