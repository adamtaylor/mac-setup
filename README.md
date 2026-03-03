# 🍎 mac-setup

Scripts to bootstrap a new Mac with my preferred apps, tools, and configuration.

## What it does

- **Homebrew** — installs Homebrew and all packages, casks, and App Store apps from the `Brewfile`
- **Shell** — writes a clean `~/.zshrc` with zsh-autosuggestions, zsh-syntax-highlighting, and Starship prompt
- **Vim** — writes a minimal `~/.vimrc` with sane defaults
- **Git** — configures global git settings with separate email identities for personal (`~/code/personal`) and work (`~/code/adzuna`) repos
- **1Password** — configures the SSH agent socket and `~/.ssh/config`
- **macOS** — applies system preferences for trackpad, dock, and menu bar

## Install

Download the repo:

```bash
curl -fsSL https://github.com/adamtaylor/mac-setup/archive/refs/heads/main.tar.gz | tar -xz \
    && mv mac-setup-main mac-setup && cd mac-setup
```

Then run:

```bash
./install.sh
```

## Scripts

| Script | Description |
|---|---|
| `install.sh` | Top-level entry point — runs all scripts in order |
| `bootstrap.sh` | Installs Homebrew, Brewfile packages, vim and shell config |
| `git.sh` | Configures git, aliases, and global .gitignore |
| `1password.sh` | Configures 1Password SSH agent |
| `mac-config.sh` | Applies macOS system preferences |

## Manual steps

A few things can't be automated and need to be done manually after running the scripts:

- Sign in to **1Password** before running `1password.sh`
- Sign in to the **App Store** before running `brew bundle` if any App Store apps are in the Brewfile
- **Restart** your machine after running `mac-config.sh` for all system preference changes to take effect
