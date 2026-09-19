#!/bin/bash

find . -name ".git" -type d -print0 | while IFS= read -r -d $'\0' dir; do
  # Extract the parent directory cleanly instead of appending "/.."
  repo_dir="${dir%/*}"
  echo "----------------------------------------"
  echo "Pulling in $repo_dir..."

  # Run inside a subshell to ensure directory state is perfectly isolated
  (
    cd "$repo_dir" || exit 1

    # 1. Bypass detached HEAD states (e.g., ComfyUI GUI updates)
    if ! git symbolic-ref -q HEAD > /dev/null 2>&1; then
      echo "  -> Skipping: Not currently on a branch (detached HEAD)."
      exit 0
    fi

    # 2. Bypass repositories that don't have a remote configured
    if ! git rev-parse --abbrev-ref @{u} > /dev/null 2>&1; then
      echo "  -> Skipping: No upstream tracking branch configured."
      exit 0
    fi

    # 3. Warn if there are local uncommitted changes that might block the pull
    if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
      echo "  -> Warning: Uncommitted changes detected. Git may abort the pull."
    fi

    # 4. Attempt the pull and catch network/conflict errors without halting the loop
    if ! git pull; then
      echo "  -> ERROR: Git pull failed (check conflicts, network, or permissions)."
    fi
  )
done
echo "----------------------------------------"
