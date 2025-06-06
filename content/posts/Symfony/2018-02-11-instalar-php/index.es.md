---
title: "Instalar PHP"
slug: "symfony/instalar-php"
date: 2018-02-11T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [symfony]
---

Instalar PHP y algún extra
```bash
sudo apt-get install php
sudo apt-get install php-xdebug
sudo apt-get install php-intl
```

Comprobar la versión de PHP instalada
```bash
php -v
```

Instalar los **estándares del estilo de código y comentarios** que sigue Symfony, estos son los PSR-0 PSR-1 PSR-2 PSR-4 de PHP.
Para esto instalaremos php-codesniffer
```bash
sudo apt-get install php-codesniffer
```

## Instalar estándares de código

Con esto ya tendremos donde instalar estándares de desarrollo, en mi caso:
```bash
/usr/share/php/PHP/CodeSniffer/src/Standards
```

Nos moveremos hasta el para posteriormente incluir los estándares.
```bash
cd /usr/share/php/PHP/CodeSniffer/src/Standards
```

**\***En caso de no tener instalado **git** en el sistema lo instalamos para poder clonar el repositorio.
```bash
sudo apt-get install git
```

Si buscamos "*symfony coding standard*" en Google,  en el primer resultado de Github podremos clonarlo:
```bash
git clone git://github.com/djoos/Symfony-coding-standard.git
```

**AVISO**: en el paso tres nos colocamos en el repositorio "/usr/share/php/PHP/CodeSniffer/src/Standards" debemos seguir en él.

Añadir el repositorio clonado a las rutas de codesniffer, especificaremos la ruta absoluta.
```bash
sudo phpcs --config-set installed_paths /usr/share/php/PHP/CodeSniffer/src/Standards/Symfony-coding-standard/
```

Comprobamos que ha sido instalado correctamente
```bash
phpcs -i
```

En la consola tendría que aparecer Symfony entre otros.

## Referencias

David Morales, [instalacion de PHP](https://youtu.be/36dysH8sNVU)

David Joos, [standares](https://github.com/djoos/Symfony-coding-standard)

