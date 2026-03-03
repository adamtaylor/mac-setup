#!/bin/bash

# ┌─────────────────────┐
# │  🍺  Setup Homebrew │
# └─────────────────────┘

echo "┌─────────────────────┐"
echo "│  🍺  Setup Homebrew │"
echo "└─────────────────────┘"
echo ""

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "  → Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "  → Homebrew already installed, skipping."
fi

# Add Homebrew to PATH
grep -qxF 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zprofile \
  || echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Verify Homebrew installation
if command -v brew &>/dev/null; then
  echo "  ✓ Homebrew installed: $(brew --version)"
else
  echo "  ✗ ERROR: Homebrew installation failed"
  exit 1
fi

# Install applications from Brewfile
echo "  → Installing packages from Brewfile..."
brew bundle
echo ""

# ┌──────────────────┐
# │  🛠️  Vim Config  │
# └──────────────────┘

echo "┌──────────────────┐"
echo "│  🛠️  Vim Config  │"
echo "└──────────────────┘"
echo ""

echo "  → Writing ~/.vimrc..."
cat > ~/.vimrc <<'EOF'
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
highlight LineNr ctermfg=239
EOF
echo "  ✓ ~/.vimrc written"
echo ""

# ┌───────────────────┐
# │  🐚  Shell Config │
# └───────────────────┘

echo "┌───────────────────┐"
echo "│  🐚  Shell Config │"
echo "└───────────────────┘"
echo ""

echo "  → Writing ~/.zshrc..."
cat > ~/.zshrc <<'EOF'
export EDITOR=vim

# 1Password SSH agent
export SSH_AUTH_SOCK=~/.1password/agent.sock

# Completions (silently ignore insecure files from app bundles e.g. Docker, Ghostty)
autoload -Uz compinit && compinit -u

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt (keep last)
eval "$(starship init zsh)"
EOF
echo "  ✓ ~/.zshrc written"
echo ""
