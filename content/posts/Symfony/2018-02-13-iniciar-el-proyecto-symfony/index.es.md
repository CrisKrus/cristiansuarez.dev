---
title: "Iniciar el proyecto Symfony"
slug: "symfony/iniciar-el-proyecto-symfony"
date: 2018-02-13T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [symfony]
---

Estando en el directorio en el que queremos crear el proyecto ejecutamos
```bash
composer create-project symfony/skeleton my_project
```

Siendo *my_project* el nombre del proyecto.

Una vez descargado todo, se crea el árbol de directorios y nos indica que debemos entrar en el directorio del proyecto y ejecutar
```bash
php -S 127.0.0.1:8000 public/index.php
```

Con ello nuestro terminal quedara "inutilizado" ejecutando el proyecto, para cerrarla bastara con pulsar la combinación de teclas **Ctrl + c**

Tras ello si vamos a nuestro explorador web y entramos en `http://localhost:8000/` veremos la pagina de inicio de nuestro proyecto.

**NOTA**: Se puede usar cualquier otro puerto si este se encuentra en uso, en mi caso el 8000 no hay problema.

## Referencias

Symfont, [configuracion symfony](https://symfony.com/doc/current/setup.html)

Curso en video, [primeros pasos con symfony](https://knpuniversity.com/screencast/symfony)

