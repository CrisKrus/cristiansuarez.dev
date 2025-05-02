# cristiansuarez.dev

## Descargar el proyecto

```cmd
git clone git@github.com:CrisKrus/cristiansuarez.dev.git
git submodule update --init --recursive
```

## Lanzar Hugo en local con Docker

```cmd
docker run --rm -it -p 1313:1313 -v $(pwd):/src klakegg/hugo:ext-alpine server
```

