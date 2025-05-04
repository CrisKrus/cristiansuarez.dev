# Scripts para la Gestión del repositorio

## Verificar Enlaces Rotos en Archivos Markdown

### Descripción

Este script en Node.js busca e identifica enlaces rotos en archivos Markdown dentro de un directorio específico. Los enlaces rotos se registran en la consola para que puedan ser corregidos manualmente.

### ¿Qué hace el script?

1. **Recorre los archivos Markdown** en el directorio especificado y sus subdirectorios.
2. **Identifica enlaces rotos** que no sean externos (es decir, que no comiencen con `http://` o `https://`).
3. **Registra los enlaces rotos** en la consola, indicando el archivo y el enlace roto.

### Requisitos

- Tener instalado Node.js en tu sistema.

### Uso

1. **Copia el script** en un archivo llamado `check-links.js`.
2. **Configura el directorio base**: Cambia el valor de la constante `BASE_DIR` en el script para que apunte al directorio donde están tus archivos Markdown.
3. **Ejecuta el script**: Abre una terminal y ejecuta el siguiente comando:
   ```bash
   node check-links.js
   ```
4. **Resultados**: El script mostrará en la consola una lista de enlaces rotos encontrados, indicando el archivo y el enlace roto.

### Notas

- Los enlaces externos (URLs) no se verifican ni se modifican.
- Este script no corrige automáticamente los enlaces rotos; deberás corregirlos manualmente en los archivos Markdown.

### Ejemplo

Si tienes un archivo Markdown con el siguiente contenido:

```markdown
![Imagen rota](imagen-no-existe.jpg)
```

Y el archivo `imagen-no-existe.jpg` no existe en el mismo directorio, el script mostrará en la consola:

```
Enlaces rotos encontrados:
Archivo: content/posts/mi-articulo.md, Enlace roto: imagen-no-existe.jpg
```

---

## Agregar Categoría al Slug en Archivos Markdown

### Descripción

Este script modifica los archivos Markdown para incluir la categoría principal en el campo `slug`. La categoría principal se extrae del campo `categories` en el archivo Markdown.

### ¿Qué hace el script?

1. **Busca archivos Markdown** en el directorio especificado y sus subdirectorios.
2. **Extrae la primera categoría** del campo `categories` en cada archivo.
3. **Modifica el campo `slug`** para incluir la categoría como prefijo.

### Requisitos

- Tener instalado Bash en tu sistema.

### Uso

1. **Configura el directorio base**: Cambia el valor de la variable `BASE_DIR` en el script para que apunte al directorio donde están tus archivos Markdown.
2. **Ejecuta el script**: Abre una terminal y ejecuta el siguiente comando:
   ```bash
   bash add-category-to-slug.sh
   ```
3. **Resultados**: El script actualizará el campo `slug` en cada archivo Markdown.

### Notas

- Si un archivo no tiene el campo `categories`, no se modificará.
- El script no realiza copias de seguridad, por lo que se recomienda usar un sistema de control de versiones.

---

## Listar Artículos en el Repositorio

### Descripción

Este script genera un listado de los artículos en el repositorio, extrayendo información clave como el título, slug, ruta, directorio, y categorías.

### ¿Qué hace el script?

1. **Busca archivos Markdown** en el directorio especificado y sus subdirectorios.
2. **Extrae información clave** como el título, slug, directorio, y categorías.
3. **Genera un archivo de log** con el listado de artículos.

### Requisitos

- Tener instalado Bash en tu sistema.

### Uso

1. **Ejecuta el script**: Abre una terminal y ejecuta el siguiente comando:
   ```bash
   bash listar_artículos.sh
   ```
2. **Resultados**: El script generará un archivo `articulos.log` con el listado de artículos.

### Notas

- Si un archivo no tiene un título o categorías, se indicará como "No especificado".
- El archivo de log se sobrescribe cada vez que se ejecuta el script.

### Ejemplo de Salida

El archivo `articulos.log` tendrá un formato similar al siguiente:

```
Listado de artículos:
----------------------
Título: Mi Primer Artículo
Slug: mi-primer-articulo
Ruta: content/posts/2023-01-01-mi-primer-articulo.md
Directorio: 2023-01-01-mi-primer-articulo
Categoría (ruta): programming
Categorías (markdown): [programming, javascript]
----------------------
Total de artículos encontrados: 1
```

---

## Validar Convenciones de Nombres de Directorios

### Descripción

Este script valida que los directorios que contienen los artículos cumplan con la convención de nombres `yyyy-mm-dd-title`.

### ¿Qué hace el script?

1. **Recorre los directorios** en el directorio especificado.
2. **Valida los nombres de los directorios** según la convención `yyyy-mm-dd-title`.
3. **Excluye directorios excepcionales** definidos en el script.

### Requisitos

- Tener instalado Bash en tu sistema.

### Uso

1. **Ejecuta el script**: Abre una terminal y ejecuta el siguiente comando:
   ```bash
   bash validate_posts.sh
   ```
2. **Resultados**: El script mostrará en la consola los errores encontrados o confirmará que todos los directorios cumplen con la convención.

### Notas

- Los directorios excepcionales se definen en el script en la variable `exceptions`.
- Si se encuentran errores, el script devolverá un código de salida `1`.

### Ejemplo de Salida

Si un directorio no cumple con la convención, el script mostrará:

```
ERROR: Invalid directory name: content/posts/invalid-directory. Expected format: 'yyyy-mm-dd-title'
Directory naming validation failed with 1 error(s).
```

Si todos los directorios son válidos, el script mostrará:

```
Directory naming validation passed.
```
