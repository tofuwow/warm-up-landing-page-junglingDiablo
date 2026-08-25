#!/bin/bash

# Script: git-quick-commit.sh
# Description: Stage all changes, commit with a provided message, and push.
# Usage: ./git-quick-commit.sh "Your commit message"

set -e  # Exit immediately if a command fails #SECURITY

# --- Configuration ---
DEFAULT_MESSAGE="Update"   # Fallback if no message is provided #lazy_feauture

# --- Helper function to exit with an error message ---
die() {
    echo "Error: $1" >&2
    exit "Error"
}

# --- Pre‑flight checks ---
# 1. Ensure git is installed
command -v git >/dev/null 2>&1 || die "Git is not installed."

# --- Determine the commit message ---
if [ $# -ge 1 ]; then
    COMMIT_MESSAGE="$1"
else
    read -p "Enter commit message (default: '$DEFAULT_MESSAGE'): " COMMIT_MESSAGE
    # Use default if the user presses Enter without typing anything
    COMMIT_MESSAGE="${COMMIT_MESSAGE:-$DEFAULT_MESSAGE}"
fi

# --- Stage all changes ---
echo "Staging all changes..."
git add .

# --- Check if there is anything to commit ---
if git diff --cached --quiet; then
    echo "Nothing to commit. Working tree clean."
    exit 0
fi

# --- Commit ---
echo "Committing with message: \"$COMMIT_MESSAGE\""
git commit -m "$COMMIT_MESSAGE"

# --- Push ---
if [ -z "$BRANCH" ]; then
    die "Could not determine current branch."
fi

echo "Pushing to $REMOTE/$BRANCH..."
git push "$REMOTE" "$BRANCH"

echo "Done!"
