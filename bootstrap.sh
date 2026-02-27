# Bootstrap script for setting up a new OS X machine

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Verify homebrew installation
if command -v brew &>/dev/null; then
  echo "Homebrew is installed: $(brew --version)"
else
  echo "ERROR: Homebrew is not installed"
fi

# Install applications from Brewfile
brew bundle