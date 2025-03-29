#!/bin/bash
find . -name ".git" -type d -print0 | while IFS= read -r -d $'\0' dir; do
  echo "Pulling in $dir..."
  cd "$dir/.." && git pull && cd - > /dev/null
done
