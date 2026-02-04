#!/bin/bash
# create-scratchpad.sh - Create a scratchpad file with random hex ID for structured thinking

set -e

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "Error: Not a git repository" >&2
    exit 1
fi

# Get repository root
REPO_ROOT=$(git rev-parse --show-toplevel)
GITIGNORE="$REPO_ROOT/.gitignore"
SCRATCHPAD_DIR="$REPO_ROOT/.specs/scratchpad"
SCRATCHPAD_PATTERN=".specs/scratchpad/"

# Create .gitignore if it doesn't exist
if [ ! -f "$GITIGNORE" ]; then
    touch "$GITIGNORE"
fi

# Check if .specs/scratchpad/ is in .gitignore
if ! grep -qF "$SCRATCHPAD_PATTERN" "$GITIGNORE"; then
    # Ensure the file ends with a newline before appending
    [ -s "$GITIGNORE" ] && [ -z "$(tail -c 1 "$GITIGNORE")" ] || echo "" >> "$GITIGNORE"
    echo "$SCRATCHPAD_PATTERN" >> "$GITIGNORE"
fi

# Create scratchpad directory if it doesn't exist
mkdir -p "$SCRATCHPAD_DIR"

# Generate random 8-character hex ID using openssl (avaiable on linux and macos)
HEX_ID=$(openssl rand -hex 4)

# Create scratchpad file
SCRATCHPAD_FILE="$SCRATCHPAD_DIR/${HEX_ID}.md"
touch "$SCRATCHPAD_FILE"

# Output the path (relative to repo root for cleaner output)
echo "${SCRATCHPAD_FILE#$REPO_ROOT/}"
