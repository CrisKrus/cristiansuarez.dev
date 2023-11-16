---
title: "pipenv VS venv"
date: 2021-10-14T00:00:00.000Z
draft: false
hideLastModified: false
summary: ""
categories: [Python]
---

`Virtualenv` fue la primera version para gestionar entornos en python, esto evolucionó a `pipenv` para tener una interfaz más cómoda y fácil de usar.

En la propia web de python recomiendan usar pipenv.

> Tool recommendations: 
> If you’re familiar with Python packaging and installation, and just want to know what tools are currently recommended, then here it is.
> 
> Application dependency management:
> Use Pipenv to manage library dependencies when developing Python applications. See Managing Application Dependencies for more details on using pipenv.

## ¿Cómo usar pipenv?

Para instalar pipenv primero necesitas tener instalado `pip`. Una vez lo tengas ejecuta lo siguiente

```
pip install pipenv
```

Después de esto, puedes crear un entorno de la siguiente forma

```
pipenv install
```

Esto buscará un fichero pipenv, si no existe creará un nuevo entorno y lo activará. Si lo comparas con el flujo de trabajo que anteriormente se usaba con virtualenv, el de pipenv está muy simplificado. Una vez creado puedes activarlo ejecutando este comando

```
pipenv shell
```

Para instalar un nuevo paquete ejecuta `pip install package` , pipenv añadirá automáticamente el paquete a tu fichero `Pipfile`. Otra opción es instalar paquetes solamente para le entorno de desarrollo como mostramos a continuación

```
pip install <package> --dev
```

## Recursos 🔗

[Application-dependency-management](https://packaging.python.org/guides/tool-recommendations/#application-dependency-management)

[Pipenv vs virtualenv vs conda environment](https://medium.com/@krishnaregmi/pipenv-vs-virtualenv-vs-conda-environment-3dde3f6869ed)

[pipenv or virtualenv , which one is better to use?](https://stackoverflow.com/questions/58352528/pipenv-or-virtualenv-which-one-is-better-to-use)
