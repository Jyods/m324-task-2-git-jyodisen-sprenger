#!/bin/bash

# Check if README.md and index.html exist
if [[ ! -f "README.md" || ! -f "index.html" ]]; then
    echo "README.md or index.html not found!"
    exit 1
fi

# Read the contents of README.md
readme_content=$(<README.md)

# Escape special characters in README content for sed
escaped_readme=$(printf '%s\n' "$readme_content" | sed 's/[&/\]/\\&/g')

# Replace the body content of index.html with the content of README.md
sed -i '/<body>/,/<\/body>/c\<body>\n'"$escaped_readme"'\n</body>' index.html

echo "index.html has been updated with the content of README.md"
