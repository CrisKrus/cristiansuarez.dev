# cristiansuarez.dev

Blog personal de Cristian Suarez Dev aka flip flop developer, donde comparte lo que aprende, experiencias y reflexiones sobre desarrollo de software.

Este proyecto utiliza [Hugo](https://gohugo.io/) como generador de sitios estáticos. Para más información sobre Hugo, consulta su [documentación oficial](https://gohugo.io/documentation/).

## Descargar el proyecto

```cmd
git clone git@github.com:CrisKrus/cristiansuarez.dev.git
git submodule update --init --recursive
```

## Trabajar con Hugo en Docker

El proyecto fija Hugo Extended `0.164.0` en Docker tanto para desarrollo local
como para el despliegue en GitHub Pages. No es necesario instalar Hugo en el
equipo anfitrión.

### Servidor local

```bash
docker compose up hugo
```

La aplicación estará disponible en `http://localhost:1313/`

### Generar el sitio de producción

```bash
docker compose run --rm hugo hugo --minify
```

La salida se genera en `public/`, que está excluido del control de versiones.
