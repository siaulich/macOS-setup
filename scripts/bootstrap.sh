#!/bin/zsh

set -e

REPO="$HOME/macos-setup"

ln -sf "$REPO/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$REPO/git/.gitconfig" "$HOME/.gitconfig"

if command -v brew >/dev/null 2>&1; then
    brew bundle --file="$REPO/homebrew/Brewfile"
fi

echo "macOS setup complete."

