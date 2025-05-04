#!/bin/bash

# Archivo de log
LOG_FILE="articulos.log"

# Inicializar el log
echo "Listado de artículos:" > "$LOG_FILE"
echo "----------------------" >> "$LOG_FILE"

# Contador de artículos
count=0

# Buscar archivos Markdown y procesarlos
for file in $(find content/posts -type f -name "*.md"); do
  # Extraer el título del artículo
  title=$(grep -m 1 "^title:" "$file" | sed 's/^title: //')

  # Extraer el slug (nombre del archivo sin extensión)
  slug=$(basename "$file" .md)

  # Extraer el nombre del directorio contenedor (fecha-descripcion)
  directory=$(basename "$(dirname "$file")")

  # Si se encuentra un título, registrar en el log
  if [[ -n "$title" ]]; then
    echo "Título: $title" >> "$LOG_FILE"
    echo "Slug: $slug" >> "$LOG_FILE"
    echo "Ruta: $file" >> "$LOG_FILE"
    echo "Directorio: $directory" >> "$LOG_FILE"
    echo "----------------------" >> "$LOG_FILE"
    ((count++))
  fi
done

# Agregar el conteo final al log
echo "Total de artículos encontrados: $count" >> "$LOG_FILE"

# Mensaje final
echo "Log generado en $LOG_FILE"
