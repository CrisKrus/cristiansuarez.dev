# Add Slug to Articles Script

## Purpose

This script is designed to add a `slug` field to the metadata section of all Markdown articles in the `/content/posts` directory. The `slug` is generated based on the article title, ensuring it is in lowercase, without special characters (like tildes), and with spaces replaced by hyphens. This field is useful for creating SEO-friendly URLs or organizing articles programmatically.

## How It Works

1. The script scans all `.md` files in the `/content/posts` directory.
2. It extracts the `title` field from the metadata section of each file.
3. A `slug` is generated from the title by:
   - Converting it to lowercase.
   - Replacing spaces with hyphens.
   - Removing special characters like tildes.
4. If the `slug` field does not already exist in the file, it is added immediately after the `title` field.

## Usage Instructions

1. **Save the Script**  
   Ensure the script is saved as `add_slug_to_articles.sh` in the `/scripts` directory.

2. **Make the Script Executable**  
   Run the following command to make the script executable:
   ```bash
   chmod +x /workspaces/cristiansuarez.dev/scripts/add_slug_to_articles.sh
   ```

3. **Run the Script**  
   Execute the script using:
   ```bash
   /workspaces/cristiansuarez.dev/scripts/add_slug_to_articles.sh
   ```

4. **Verify Changes**  
   After running the script, check the `.md` files in the `/content/posts` directory to ensure the `slug` field has been added correctly.

## Notes

- The script will not overwrite an existing `slug` field. If a file already contains a `slug`, it will be skipped.
- Ensure all articles have a `title` field in their metadata, as the script relies on it to generate the `slug`.
- The script is non-destructive and only appends the `slug` field if it is missing.

## Example

### Before Running the Script
```markdown
---
title: "Curiosidades de ruby parte 2"
date: 2018-09-23T09:01:14.385Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---
```

### After Running the Script
```markdown
---
title: "Curiosidades de ruby parte 2"
slug: "curiosidades-de-ruby-parte-2"
date: 2018-09-23T09:01:14.385Z
draft: false
hideLastModified: false
summary: ""
categories: [Ruby]
---
```
