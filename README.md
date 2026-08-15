# cristiansuarez.dev

Blog personal de Cristian Suarez Dev aka flip flop developer, donde comparte lo que aprende, experiencias y reflexiones sobre desarrollo de software.

Este proyecto utiliza [Hugo](https://gohugo.io/) como generador de sitios estáticos. Para más información sobre Hugo, consulta su [documentación oficial](https://gohugo.io/documentation/).

## Descargar el proyecto

```cmd
git clone git@github.com:CrisKrus/cristiansuarez.dev.git
git submodule update --init --recursive
```

## Lanzar Hugo en local con Docker

```bash
docker run --rm -it \
  -p 1313:1313 \
  -v "$(pwd)":/src \
  docker.io/hugomods/hugo:debian-exts-0.152.2 \
  server --bind 0.0.0.0
```

La aplicación estará disponible en `http://localhost:1313/`
