# Validaciones de Estructura de Posts

Este documento describe las validaciones implementadas en el script 
`validate_posts.sh`, que asegura que los posts en el repositorio cumplan con 
las reglas de organización descritas en la 
[Guía de Organización de Posts](./post-organization.md).

## Funciones de Validación

El script contiene tres funciones principales, cada una encargada de validar 
un aspecto específico de la estructura de los posts.

### 1. `validate_slug_matches_title`

#### Propósito
Esta función verifica que el slug (nombre del directorio del post) coincida 
con el título del post, eliminando caracteres especiales y normalizando el 
texto.

#### Detalles
- El slug debe ser igual al título del post, pero en minúsculas, sin caracteres 
  especiales y con espacios reemplazados por guiones (`-`).
- Si hay una discrepancia, se muestra un error indicando el archivo afectado y 
  el slug esperado.

#### Ejemplo de Error
```
ERROR: Slug mismatch in content/posts/ruby/2023-10-01-introduccion-a-ruby/index.es.md: expected 'introduccion-a-ruby', found 'intro-a-ruby'
```

#### Uso
Esta función se ejecuta automáticamente al correr el script. Para ejecutarla 
manualmente:
```bash
bash scripts/validate_posts.sh
```

---

### 2. `validate_directory_naming_convention`

#### Propósito
Esta función valida que los nombres de los directorios de los posts sigan el 
formato `yyyy-mm-dd-descripcion`.

#### Detalles
- El nombre del directorio debe comenzar con una fecha en formato `yyyy-mm-dd`, 
  seguida de un identificador descriptivo.
- Si un directorio no cumple con este formato, se muestra un error indicando el 
  directorio afectado.

#### Ejemplo de Error
```
ERROR: Invalid directory name: content/posts/ruby/2023-10-01-intro. Expected format: 'yyyy-mm-dd-title'
```

#### Uso
Esta función se ejecuta automáticamente al correr el script. Para ejecutarla 
manualmente:
```bash
bash scripts/validate_posts.sh
```

#### Excepciones
Hay tres rutas específicas que están excluidas de esta validación porque no siguen el formato estándar pero son correctas:
- `content/posts/libros/Clean-Code`
- `content/posts/libros/Comunicacion-no-violenta`
- `content/posts/ponencia/resources`

Estas rutas no generarán errores durante la validación.

### 3. `validate_non_markdown_files_in_resources`

#### Propósito
Esta función asegura que todos los archivos que no sean Markdown (`.md`) estén 
dentro de un subdirectorio `resources` dentro del directorio del post 
correspondiente.

#### Detalles
- Los archivos como imágenes, scripts, etc., deben estar organizados en un 
  subdirectorio `resources`.
- Si un archivo no Markdown está fuera de `resources`, se muestra un error 
  indicando el archivo afectado.

#### Ejemplo de Error
```
ERROR: Non-Markdown file found outside 'resources' directory: content/posts/ruby/2023-10-01-introduccion-a-ruby/imagen1.jpg
```

#### Uso
Esta función se ejecuta automáticamente al correr el script. Para ejecutarla 
manualmente:
```bash
bash scripts/validate_posts.sh
```

---

## Cómo Usar el Script

El script `validate_posts.sh` puede ejecutarse tanto localmente como en la 
pipeline de GitHub Actions. Sigue estos pasos para usarlo:

### Ejecución Local
1. Asegúrate de que el script sea ejecutable:
   ```bash
   chmod +x scripts/validate_posts.sh
   ```
2. Ejecuta el script:
   ```bash
   ./scripts/validate_posts.sh
   ```
3. Si alguna validación falla, el script mostrará un mensaje de error y 
   devolverá un código de salida `1`.

### Uso en la Pipeline
El script ya está integrado en la pipeline de GitHub Actions en el archivo 
`.github/workflows/validate-posts.yml`. Se ejecutará automáticamente en los 
siguientes casos:
- Al crear un pull request hacia la rama `main`.
- Al hacer un push a la rama `main`.

---

## Notas Adicionales
- Si necesitas modificar las reglas de validación, edita el archivo 
  `scripts/validate_posts.sh`.
- Consulta la [Guía de Organización de Posts](./post-organization.md) para más 
  detalles sobre las reglas de estructura.
