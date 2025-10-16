#!/bin/bash

# Install git hooks for rebide development
# This script copies the pre-commit hook to .git/hooks/

echo "Installing git hooks..."

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: Not in a git repository"
    echo "Please run this script from the root of the rebide repository"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

# Copy pre-commit hook
if [ -f "hooks/pre-commit" ]; then
    cp hooks/pre-commit .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
    echo "✅ Pre-commit hook installed successfully"
    echo ""
    echo "The hook will automatically:"
    echo "  - Update VERSION_DATE on every commit to rebide"
    echo "  - Bump minor version by default"
    echo "  - Bump major version with [major] in commit message"
else
    echo "❌ Error: hooks/pre-commit not found"
    exit 1
fi
