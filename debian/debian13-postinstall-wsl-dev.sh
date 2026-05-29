#!/usr/bin/env bash

set -euo pipefail

clear

echo "========================================"
echo "   Debian 13 WSL Development Setup"
echo "========================================"
echo ""

# System Update
echo "-> Updating system packages..."
sudo apt update
sudo apt upgrade -y

# Base Packages
echo ""
echo "-> Installing required packages..."

sudo apt install -y \
  build-essential \
  curl \
  git \
  zsh

# Homebrew Installation
echo ""
echo "-> Installing Homebrew..."

NONINTERACTIVE=1 /bin/bash -c \
"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew Configuration
echo ""
echo "-> Configuring Homebrew..."

BREW_ENV='eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'

if ! grep -qxF "$BREW_ENV" ~/.zprofile; then
  echo "$BREW_ENV" >> ~/.zprofile
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#
# Developer Tools
#

echo ""
echo "-> Installing developer tools..."

brew install \
  mise \
  lazygit

# Mise Configuration
echo ""
echo "-> Configuring mise..."

MISE_INIT='eval "$(mise activate zsh)"'

if ! grep -qxF "$MISE_INIT" ~/.zshrc; then
  echo "$MISE_INIT" >> ~/.zshrc
fi

# Default Shell
echo ""
echo "-> Setting zsh as default shell..."

sudo chsh -s "$(which zsh)" "$USER"

#
# Runtime Installation
#

echo ""
echo "-> Installing language runtimes with mise..."

mise use -g node@lts
mise use -g python@latest
mise use -g java@21
mise use -g go@latest

# Final Message
echo ""
echo "========================================"
echo " Development environment setup complete"
echo "========================================"
echo ""
echo "Please restart your terminal or run:"
echo "  source ~/.zprofile"
echo "  source ~/.zshrc"
echo ""
