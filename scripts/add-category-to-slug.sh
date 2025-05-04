#!/bin/bash

# Ruta base donde están los archivos markdown
BASE_DIR="content/posts"

# Buscar todos los archivos .md bajo la ruta especificada
find "$BASE_DIR" -type f -name "*.md" | while read -r file; do
  # Extraer la primera categoría del campo "categories" y eliminar el corchete de cierre si existe
  first_category=$(grep -m 1 '^categories:' "$file" | sed -E 's/categories: \[([^,]+).*/\1/' | tr -d '[]' | xargs)

  # Convertir espacios en guiones
  formatted_category=$(echo "$first_category" | sed 's/ /-/g')

  # Modificar el campo "slug" en el archivo
  sed -i '' -E "s|^slug: \"([^\"]+)\"|slug: \"$formatted_category/\1\"|" "$file"
done

echo "Actualización de slugs completada."