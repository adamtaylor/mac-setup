#!/bin/bash

# ┌─────────────────┐
# │  🗂️   Git Setup  │
# └─────────────────┘

echo "┌─────────────────┐"
echo "│  🗂️   Git Setup  │"
echo "└─────────────────┘"
echo ""

# ── Global Config ─────────────────────────────────
echo "  → Writing ~/.gitconfig..."
cat > ~/.gitconfig <<'EOF'
[user]
    name = Adam Taylor
    email = adamjctaylor@gmail.com

[includeIf "gitdir:~/code/adzuna/"]
    path = ~/.gitconfig-adzuna

[core]
    editor = vim
    excludesfile = ~/.gitignore_global

[init]
    defaultBranch = main

[pull]
    rebase = true

[rebase]
    autoStash = true

[rerere]
    enabled = true

[push]
    autoSetupRemote = true

[alias]
    st = status
    co = checkout
    br = branch
    ci = commit
    lg = log --oneline --graph --decorate --all
    undo = reset HEAD~1 --mixed
    aliases = config --get-regexp alias
EOF
echo "  ✓ ~/.gitconfig written"

# ── Work Config ───────────────────────────────────
echo "  → Writing ~/.gitconfig-adzuna..."
cat > ~/.gitconfig-adzuna <<'EOF'
[user]
    email = adam@adzuna.com
EOF
echo "  ✓ ~/.gitconfig-adzuna written"

# ── Global .gitignore ─────────────────────────────
echo "  → Writing ~/.gitignore_global..."
cat > ~/.gitignore_global <<'EOF'
# macOS
.DS_Store
.AppleDouble
.LSOverrideDirectory
._*

# Thumbnails
Thumbs.db

# Editors
*.swp
*.swo
*~
.idea/
.vscode/

# Environment
.env
.env.local
.env.*.local

# Logs
*.log
npm-debug.log*

# Dependencies
node_modules/
EOF
echo "  ✓ ~/.gitignore_global written"
echo ""
