# Guía de Organización de Posts

Esta guía describe la estructura estándar para organizar los posts en el sitio, teniendo en cuenta el uso del tema PaperMod de Hugo.

## Estructura General

Los posts se organizan bajo el directorio `content/posts/` y se clasifican por temática en el primer nivel. Cada post tiene su propio directorio, cuyo nombre comienza con la fecha en formato `yyyy-mm-dd`, seguido de un identificador descriptivo. Los recursos asociados al post se colocan en una subcarpeta `resources` dentro del directorio del post.

### Ejemplo de Estructura

```
content/
├── about.md
├── archive.md
├── search.md
├── posts/
│   ├── ruby/
│   │   ├── 2023.10.01-introduccion-a-ruby/
│   │   │   ├── index.es.md
│   │   │   ├── index.en.md
│   │   │   └── resources/
│   │   │       ├── imagen1.jpg
│   │   │       └── ejemplo.rb
│   │   └── 2023.10.02-avanzando-en-ruby/
│   │       ├── index.es.md
│   │       ├── index.en.md
│   │       └── resources/
│   │           └── imagen2.png
│   ├── libros/
│   │   └── 2023.10.03-resena-de-un-libro/
│   │       ├── index.es.md
│   │       ├── index.en.md
│   │       └── resources/
│   │           └── portada.jpg
│   └── ...
```

## Detalles de la Organización

1. **Clasificación por Temática**:
   - El primer nivel bajo `posts/` corresponde a la temática del contenido, como `ruby`, `libros`, etc.

2. **Formato de Nombres de los Posts**:
   - Cada post tiene un directorio cuyo nombre sigue el formato: `yyyy-mm-dd-descripcion`.
   - Ejemplo: `2023-10-01-introduccion-a-ruby`.

3. **Archivos Multi-Idioma**:
   - Cada post incluye un archivo por idioma, con el sufijo del código de idioma (`.es.md`, `.en.md`, etc.).
   - Ejemplo: `index.es.md` para español, `index.en.md` para inglés.

4. **Recursos Asociados**:
   - Los recursos del post (imágenes, archivos, etc.) se colocan en una subcarpeta `resources` dentro del directorio del post.

5. **Casos Especiales**:
   - Los archivos `about.md`, `archive.md` y `search.md` permanecen en sus ubicaciones actuales, ya que son gestionados por el tema PaperMod.
   - Los directorios `quotes` y `talks` deben de estar a la misma altura de `posts`.

## Ventajas de esta Estructura

- **Orden Cronológico**: Los posts se organizan automáticamente por fecha dentro de cada temática.
- **Gestión de Recursos**: Los recursos están cerca del contenido, facilitando su manejo.
- **Soporte Multi-Idioma**: La estructura permite manejar múltiples idiomas de manera clara y escalable.
- **Compatibilidad con PaperMod**: Respeta las convenciones del tema y no interfiere con los archivos especiales.

## Notas Adicionales

- Asegúrate de que los nombres de los directorios y archivos sean descriptivos y estén en minúsculas para evitar problemas de compatibilidad.
- Usa el formato de fecha `yyyy-mm-dd` para garantizar un orden cronológico consistente.

