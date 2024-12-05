#!/bin/bash

# Check if README.md and index.html exist
if [[ ! -f "README.md" || ! -f "index.html" ]]; then
    echo "README.md or index.html not found!"
    exit 1
fi

# Read the contents of README.md and index.html
readme_content=$(<README.md)
index_content=$(<index.html)

# Extract the body content of index.html
body_content=$(sed -n '/<body>/,/<\/body>/p' index.html)

# Check if the contents are different
if [[ "$readme_content" != "$body_content" ]]; then
    # Replace the body content of index.html with the content of README.md
    sed -i '/<body>/,/<\/body>/c\<body>\n'"$readme_content"'\n</body>' index.html
    echo "index.html has been updated with the content of README.md"
    echo "The following changes readme_content made:"
    echo "$readme_content"
else
    echo "The contents of README.md and index.html are equivalent."
fi