# Bootstrap script for setting up a new OS X machine

# Install homebrew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Add homebrew to PATH
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Verify homebrew installation
if command -v brew &>/dev/null; then
  echo "Homebrew is installed: $(brew --version)"
else
  echo "ERROR: Homebrew is not installed"
fi

# Install applications from Brewfile
brew bundle 