---
title: "Primera página y controlador"
slug: "symfony/primera-pagina-y-controlador"
date: 2018-02-19T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [symfony]
---

Para crear nuestra primera página basta con crear un nuevo documento PHP
```PHP
// src/Controller/LuckyController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;

class LuckyController
{
    public function number()
    {
        $number = mt_rand(0, 100);

        return new Response(
            '<html><body>Lucky number: '.$number.'</body></html>'
        );
    }
}
```

Y luego añadir en nuestro archivo `config/routes.yaml` la siguiente línea:
```yaml
app_lucky_number:
    path: /lucky/number
    controller: App\Controller\LuckyController::number
```

Si entramos en localhost:8000/lucky/number veremos el resultado.

## Anotaciones

Para evitar tener que poner cada ruta en este archivo manualmente, usaremos las **anotaciones**. Para instalar estas (añadir la dependencia) desde el directorio del proyecto en la consola ejecutamos:
```bash
composer require annotations
```

Con esto ya podremos eliminar las líneas que habíamos puesto en _routes.yaml_
```PHP
// src/Controller/LuckyController.php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class LuckyController
{
    /**
     * @Route("/lucky/number")
     * @return Response
     */
    public function number()
    {
        $number = mt_rand(0, 100);

        return new Response(
            '<html><body>Lucky number: '.$number.'</body></html>'
        );
    }
}
```

Si entramos en localhost:8000/lucky/number veremos como todo sigue funcionando de la misma manera.

Una vez en este punto al intentar desplegar en Heroku me dio problemas:
```bash
       Script cache:clear returned with error code 255

       !!  PHP Fatal error:  Uncaught RuntimeException: APP_ENV environment variable is not defined. You need to define environment variables for configuration or add "symfony/dotenv" as a Composer dependency to load variables from a .env file. in /tmp/build_28bf132bc15e00a1674b37dec1340dc6/CrisKrus-My-Symfony-Project-f31cfde/bin/console:20

       !!  Stack trace:

       !!  #0 {main}

       !!    thrown in /tmp/build_28bf132bc15e00a1674b37dec1340dc6/CrisKrus-My-Symfony-Project-f31cfde/bin/console on line 20

       !!

 !     Push rejected, failed to compile PHP app.

 !     Push failed
```

Para solucionar este problema basta con seguir las instrucciones del error, las cuales nos indica que con añadir la dependencia de "_dotenv_" con Composer, estando dentro del directorio del proyecto.
```bash
composer require dotenv
```

Otro problema mas, si nos dirigimos a la aplicación una vez ya tenemos todo en master correctamente, veremos como no hay nada desplegado realmente. Eso es porque no hemos indicado que directorio es el que queremos que use, se lo tenemos que indicar de la siguiente forma.

Creando el archivo Procfile indicando al servidor de Heroku que carpeta, **public** en nuestro caso.
```bash
web: vendor/bin/heroku-php-apache2 public/
```

Añadir _framework-extra-bundle_ dependencia. *Esto no se hasta que punto es realmente necesario.
```bash
composer require sensio/framework-extra-bundle
```

## Referencias

Symfony, [primera página](https://symfony.com/doc/current/page_creation.html)

Symfony, [extra bundle dependencia](https://symfony.com/doc/current/bundles/SensioFrameworkExtraBundle/index.html#installation)

Symfony, [crear procfile](https://symfony.com/doc/3.3/deployment/heroku.html#create-a-procfile)

