#!/bin/bash
find . -name ".git" -type d -print0 | while IFS= read -r -d $'\0' dir; do
  echo "Pulling in $dir..."
  cd "$dir/.." && git status && cd - > /dev/null
done
