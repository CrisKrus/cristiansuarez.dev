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
