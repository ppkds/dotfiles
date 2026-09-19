#!/bin/bash

find . -name ".git" -type d -print0 | while IFS= read -r -d $'\0' dir; do
  # Extract parent directory path cleanly
  repo_dir="${dir%/*}"
  echo "========================================"
  echo "Repository: $repo_dir"
  echo "========================================"

  # Run inside an isolated subshell
  (
    cd "$repo_dir" || exit 1

    # 1. Handle detached HEAD state gracefully
    if ! branch_name=$(git symbolic-ref --short -q HEAD 2>/dev/null); then
      echo "  [STATUS] Detached HEAD (at $(git rev-parse --short HEAD 2>/dev/null))"
    else
      echo "  [BRANCH] $branch_name"
    fi

    # 2. Check for local modifications (staged or unstaged)
    if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
      echo "  [WORKING TREE] Dirty (uncommitted changes or untracked files present)"
      git status -s
    else
      echo "  [WORKING TREE] Clean"
    fi

    # 3. Check tracking branch status relative to remote (ahead/behind)
    if git rev-parse --abbrev-ref @{u} > /dev/null 2>&1; then
      upstream_status=$(git rev-list --left-right --count HEAD...@{u} 2>/dev/null)
      ahead=$(echo "$upstream_status" | awk '{print $1}')
      behind=$(echo "$upstream_status" | awk '{print $2}')

      if [ "$ahead" -gt 0 ] || [ "$behind" -gt 0 ]; then
        echo "  [REMOTE] Sync needed ($ahead ahead, $behind behind)"
      else
        echo "  [REMOTE] Up to date"
      fi
    else
      echo "  [REMOTE] No upstream tracking branch set"
    fi
  )
  echo ""
done
