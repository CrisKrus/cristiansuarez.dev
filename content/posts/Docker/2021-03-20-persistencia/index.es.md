---
title: "Persistencia"
slug: "persistencia"
date: 2021-03-20T00:00:01.000Z
draft: false
hideLastModified: false
summary: ""
categories: [docker]
summaryImage: "summary.png"
---

He escuchado varias veces decir que alguien no usa Docker porque al borrar el contenedor o al parar una base de datos toda la información se perderá en el olvido pero, nada más lejos de la realidad. Docker persiste la información en nuestro sistema no lo crea y lo mantiene en un limbo virtual 👻

Con esto quiero decir que cuando creamos un contenedor de Docker automáticamente, si no se lo indicamos, nos creará un directorio en nuestro sistema para guardar toda la información que se encuentre dentro del mismo. La clave está en que nosotros podemos definir dónde queremos que haga este mapeo, incluso decirle que directorio concreto queremos que mapee dentro del contenedor. Esto se hace con los **volúmenes**

Por ejemplo, si partimos de nuestra ***fake-api*** que hemos creado anteriormente en la cual primero copiamos nuestro código en el momento de la creación de la imagen con la sentencia `COPY . /app` dentro de nuestro archivo de configuración Dockerfile.

En el momento de la creación de la imagen no tenemos que hacer nada especial, ejecutaremos la sentencia igual que hasta ahora

```bash
docker build -t criskrus/fake-api .
```

La diferencia viene cuando creamos el contenedor. En este caso tendremos que indicar al contenedor que directorio tenemos que mapear. A nosotros para este ejemplo nos interesa que nuestro código fuente el cual modificamos en la máquina anfitriona se modifique automáticamente en el contenedor para mostrar los cambios. Esto es de bastante utilidad cuando estamos en fases de desarrollo.

Para hacer esto tendremos que añadir una nueva opción en el comando de creación indicando que el directorio actual dónde está todo nuestro código corresponde con el código que se ejecuta dentro del contenedor. Esto se hace de la siguiente forma `-v $(pwd):/app`, con esta opción decimos que el directorio actual se mapee al directorio `/app` del contenedor. Tenemos que usar el comando `pwd` porque tenemos que indicar la ruta absoluta.

Por lo tanto el nuevo comando con el que crearemos el contenedor queda de la siguiente forma.

```bash
docker run --rm -it  -p 8080:8080 -v $(pwd):/app criskrus/fake-api
```

Ahora, sin parar el contenedor, podemos hacer modificaciones en el código y veremos como se actualiza de manera automática en el contenedor. Como tenemos instalado `nodemon` esta actualización del servidor ocurrirá automáticamente al actualizar el código sin necesidad de actualizar o hacer nada en nuestro contenedor.

Con esto podremos persistir y mantener en nuestra máquina local lo que ocurra en el contenedor y nos interese mantener: configuración, logs, copias de seguridad de una base de datos, etc
