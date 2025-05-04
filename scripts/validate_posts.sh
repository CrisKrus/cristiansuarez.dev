validate_directory_naming_convention() {
  echo "Validating directory naming conventions..."
  local errors=0
  # Define exceptions
  local exceptions=(
    "content/posts/libros/Clean-Code"
    "content/posts/libros/Comunicacion-no-violenta"
    "content/posts/ponencia/resources"
  )
  
  for dir in $(find content/posts -mindepth 2 -maxdepth 2 -type d); do
    # Skip exceptions
    if [[ " ${exceptions[@]} " =~ " $dir " ]]; then
      continue
    fi

    dirname=$(basename "$dir")
    if [[ ! "$dirname" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}-.+ ]]; then
      echo "ERROR: Invalid directory name: $dir. Expected format: 'yyyy-mm-dd-title'"
      errors=$((errors + 1))
    fi
  done
  if [[ $errors -gt 0 ]]; then
    echo "Directory naming validation failed with $errors error(s)."
    exit 1
  fi
  echo "Directory naming validation passed."
}
