#!/bin/bash

# Directory containing your files
source_directory="/Users/avy/Documents/c pro/striverA2Z_practice/patterns"

# Directory to move executables without extensions and dSYM folders
destination_directory="/Users/avy/Documents/c pro/striverA2Z_practice/testing"

# Move executables and dSYM folders
cd "$source_directory" || exit

for file in *; do
  # Check if it's a regular file without extension (executable)
  if [ -f "$file" ] && [ "${file%.*}" = "$file" ]; then
    mv "$file" "$destination_directory"
  # Check if it's a directory with .dSYM extension
  elif [ -d "$file" ] && [[ "$file" == *.dSYM ]]; then
    mv "$file" "$destination_directory"
  fi
done

echo "Execution complete."
