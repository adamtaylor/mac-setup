#!/bin/bash

# ┌──────────────────────┐
# │  🔑  1Password Setup │
# └──────────────────────┘

echo "┌──────────────────────┐"
echo "│  🔑  1Password Setup │"
echo "└──────────────────────┘"
echo ""

# Create SSH agent socket symlink
echo "  → Configuring 1Password SSH agent..."
mkdir -p ~/.1password
ln -sf ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
echo "  ✓ SSH agent socket linked"

# Configure SSH to use 1Password agent
echo "  → Configuring ~/.ssh/config..."
mkdir -p ~/.ssh
touch ~/.ssh/config
grep -qF 'IdentityAgent "~/.1password/agent.sock"' ~/.ssh/config \
  || cat >> ~/.ssh/config <<'EOF'

Host *
  IdentityAgent "~/.1password/agent.sock"
EOF
echo "  ✓ ~/.ssh/config updated"
echo ""
