#!bin/bash

# Configure 1Password SSH agent
mkdir -p ~/.1password
ln -sf ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock

# Create .zshrc if it doesn't exist and add SSH_AUTH_SOCK export
touch ~/.zshrc
grep -qxF 'export SSH_AUTH_SOCK=~/.1password/agent.sock' ~/.zshrc \
  || echo 'export SSH_AUTH_SOCK=~/.1password/agent.sock' >> ~/.zshrc

# Create .ssh/config if it doesn't exist and add IdentityAgent configuration
touch ~/.ssh/config
grep -qF 'IdentityAgent "~/.1password/agent.sock"' ~/.ssh/config \
  || cat >> ~/.ssh/config << 'EOF'

Host *
  IdentityAgent "~/.1password/agent.sock"
EOF