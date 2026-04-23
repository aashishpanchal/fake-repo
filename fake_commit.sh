#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_DIR"

# Random number of commits between 4 and 8
COUNT=$(( RANDOM % 5 + 4 ))

for i in $(seq 1 "$COUNT"); do
  TIMESTAMP=$(date "+%Y-%m-%d %H:%M")
  echo "" >> README.md
  echo "Contribution: $TIMESTAMP" >> README.md
  git add README.md
  git commit -m "Contribution: $TIMESTAMP"
  # Small sleep so timestamps differ slightly
  sleep 1
done

git push origin main
