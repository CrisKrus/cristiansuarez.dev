---
title: "Cambiar mensaje del bash"
slug: "ubuntu/cambiar-mensaje-del-bash"
date: 2018-10-09T23:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [ubuntu]
---

<!-- DONE -->


  Típicamente tu bash en linux tendrá la siguiente estructura

```bash
nombre-de-usuario@nombre-de-maquina/host:directorio-actual~$

cristian-suaver@maquina-linux-de-criskrus:/Descargas~$
```

  Esto puede llegar a se mucho y taparnos la pantalla casi por completo es por
  ello que lo podemos cambiar a nuestro gusto. Para hacer esto cambio tenemos
  que modificar una variable llamada `PS1`, si queremos hacerlo de manera que
  persista en el sistema lo haremos desde el archivo `.bashrc` en nuestro
  directorio *home* (~). Una vez abierto buscamos donde declara la variable y lo
  modificamos a nuestro gusto.

  En mi caso ha pasado a quedar da la siguiente forma

```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]👉criskrus@\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

  Simplemente he borrado el nombre de usuario que tenia en la maquina `\u` y he
  puesto `👉criskrus` y tambien he borrado el nombre del host `\h`, de tal forma
  que ahora al abrir mi terminal me aparecera de la siguiente forma.

```bash
👉criskrus@:~/Descargas$
```

  Mas limpio y con menos ruido

Referencias
--------------------------------------------------------------------------------

  Más información sobre las variables y opciones disponibles en la
  [documentación][syntax-prompt]

  [syntax-prompt]: https://ss64.com/bash/syntax-prompt.html

