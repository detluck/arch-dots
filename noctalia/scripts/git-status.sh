#!/bin/sh
# Git status helper for Noctalia custom_button
REPO_DIR="${1:-$HOME/Projects/noctalia}"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo '{"label": "no repo", "glyph": "git-branch", "tooltip": "Directory is not a git repository"}'
  exit 0
fi

branch=$(git -C "$REPO_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "detached")
dirty=$(git -C "$REPO_DIR" status --porcelain 2>/dev/null | wc -l)
last_commit=$(git -C "$REPO_DIR" log -1 --pretty=format:"%s" 2>/dev/null | tr '"' "'")

if [ "$dirty" -gt 0 ]; then
  status="${branch}* (${dirty})"
else
  status="${branch}"
fi

echo "{\"label\": \"$status\", \"glyph\": \"git-branch\", \"tooltip\": \"Last commit: $last_commit\"}"
