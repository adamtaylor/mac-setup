#!/bin/bash

# ┌──────────────────────────────────────────────┐
# │  🍎  macOS Machine Bootstrap v1.0            │
# ├──────────────────────────────────────────────┤
# │  Author  :  Adam Taylor                      │
# │  Version :  1.0                              │
# │  Date    :  2026-03-03                       │
# └──────────────────────────────────────────────┘

echo "┌──────────────────────────────────────────────┐"
echo "│  🍎  macOS Machine Bootstrap v1.0            │"
echo "├──────────────────────────────────────────────┤"
echo "│  Author  :  Adam Taylor                      │"
echo "│  Version :  1.0                              │"
echo "│  Date    :  2026-03-03                       │"
echo "└──────────────────────────────────────────────┘"
echo ""

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
  echo "  ✓ Homebrew is installed: $(brew --version)"
else
  echo "  ✗ ERROR: Homebrew installation failed"
  exit 1
fi

# Install applications from Brewfile
echo "  → Installing packages from Brewfile..."
brew bundle
echo ""

# ┌───────────────────┐
# │  🐚  Shell Config │
# └───────────────────┘

echo "┌──────────────────┐"
echo "│  🛠️   Vim Config  │"
echo "└──────────────────┘"
echo ""

# Write ~/.vimrc
echo "  → Configuring vim..."
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

echo "┌───────────────────┐"
echo "│  🐚  Shell Config │"
echo "└───────────────────┘"
echo ""

touch ~/.zshrc

# Fix compinit insecure files warning and enable completions
echo "  → Configuring completions..."

# Write fix into ~/.zshrc for all future sessions
grep -qxF 'autoload -Uz compinit' ~/.zshrc || cat >> ~/.zshrc <<'EOF'

# Initialise completions, silently ignoring insecure files
autoload -Uz compinit && compinit -u
EOF
echo "  ✓ compinit configured"

# Enable zsh-autosuggestions
echo "  → Configuring autosuggestions..."
grep -qxF 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' ~/.zshrc \
  || echo 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo "  ✓ zsh-autosuggestions enabled"

# Enable zsh-syntax-highlighting
echo "  → Configuring syntax highlighting..."
grep -qxF 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ~/.zshrc \
  || echo 'source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
echo "  ✓ zsh-syntax-highlighting enabled"

# Enable Starship (keep last)
echo "  → Configuring Starship prompt..."
grep -qxF 'eval "$(starship init zsh)"' ~/.zshrc \
  || echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo "  ✓ Starship enabled"
echo ""

echo "┌──────────────────────────────────────────────┐"
echo "│  ✅  Bootstrap complete! Restart your shell. │"
echo "└──────────────────────────────────────────────┘"
