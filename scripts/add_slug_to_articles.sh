#!/bin/bash

# Directory containing the articles
ARTICLES_DIR="/workspaces/cristiansuarez.dev/content/posts"

# Function to generate slug from title
generate_slug() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed -e 's/[áàäâ]/a/g' -e 's/[éèëê]/e/g' -e 's/[íìïî]/i/g' -e 's/[óòöô]/o/g' -e 's/[úùüû]/u/g' -e 's/[^a-z0-9]/-/g' -e 's/--*/-/g' -e 's/^-//' -e 's/-$//'
}

# Iterate over all Markdown files in the directory
find "$ARTICLES_DIR" -type f -name "*.md" | while read -r file; do
  # Extract the title from the file
  title=$(grep -m 1 "^title:" "$file" | sed 's/title: "\(.*\)"/\1/')

  # Generate the slug
  slug=$(generate_slug "$title")

  # Check if the slug already exists
  if ! grep -q "^slug:" "$file"; then
    # Insert the slug after the title
    sed -i "/^title:/a slug: \"$slug\"" "$file"
    echo "Added slug to $file"
  else
    echo "Slug already exists in $file"
  fi
done
