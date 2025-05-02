find content/posts -depth -name "*.*.*" | while read path; do
  base=$(basename "$path")
  dir=$(dirname "$path")
  new_base=$(echo "$base" | sed -E 's/^([0-9]{4})\.([0-9]{2})\.([0-9]{2})/\1-\2-\3/')
  new_path="$dir/$new_base"
  if [ "$path" != "$new_path" ]; then
    mv "$path" "$new_path"
    echo "✅ Renombrado: $path → $new_path"
  fi
done
