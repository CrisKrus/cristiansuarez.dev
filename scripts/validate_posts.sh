#!/bin/bash

set -e

validate_slug_matches_title() {
  echo "Validating that directory names match slugs in frontmatter..."
  local errors=0
  for file in $(find content/posts -type f -name "*.md"); do
    # Get the directory name (full slug with date)
    full_slug=$(basename "$(dirname "$file")")
    
    # Extract title portion (remove the date prefix)
    slug_title_part=$(echo "$full_slug" | sed -E 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}-//')
    
    # Extract the slug from the frontmatter directly
    # This avoids issues with title conversion
    slug=$(grep -m 1 '^slug:' "$file" 2>/dev/null | sed 's/slug: //g' | sed 's/"//g' | sed "s/'//g" | tr -d '\r')
    
    # If slug field doesn't exist, fall back to extracting from title
    if [[ -z "$slug" ]]; then
      title=$(grep -m 1 '^title:' "$file" | sed 's/title: //g' | sed 's/"//g' | sed "s/'//g" | tr -d '\r')
      # Convert the title to a slug format (lowercase, no accents, dashes)
      slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 'y/áéíóúñ/aeioun/' | tr -d '[:punct:]' | tr ' ' '-')
    fi
    
    # Compare the extracted slug with the directory name part
    if [[ "$slug_title_part" != "$slug" ]]; then
      echo "ERROR: Slug mismatch in $file: expected '$slug', found '$slug_title_part'"
      errors=$((errors + 1))
    fi
  done
  if [[ $errors -gt 0 ]]; then
    echo "Slug validation failed with $errors error(s)."
    exit 1
  fi
  echo "Slug validation passed."
}

validate_directory_naming_convention() {
  echo "Validating directory naming conventions..."
  local errors=0
  for dir in $(find content/posts -mindepth 2 -maxdepth 2 -type d); do
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

validate_non_markdown_files_in_resources() {
  echo "Validating that non-Markdown files are in 'resources' directories..."
  local errors=0
  for file in $(find content/posts -type f ! -name "*.md"); do
    if [[ ! "$file" =~ /resources/ ]]; then
      echo "ERROR: Non-Markdown file found outside 'resources' directory: $file"
      errors=$((errors + 1))
    fi
  done
  if [[ $errors -gt 0 ]]; then
    echo "Non-Markdown file validation failed with $errors error(s)."
    exit 1
  fi
  echo "Non-Markdown file validation passed."
}

main() {
  validate_slug_matches_title
  validate_directory_naming_convention
  validate_non_markdown_files_in_resources
  echo "All validations passed successfully."
}

main

