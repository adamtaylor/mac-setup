#!/bin/bash

# ┌────────────────────┐
# │  🖥️  macOS Config  │
# └────────────────────┘

echo "┌────────────────────┐"
echo "│  🖥️  macOS Config  │"
echo "└────────────────────┘"
echo ""

# ── Menu Bar ──────────────────────────────────────
echo "  → Configuring menu bar..."
# Show Bluetooth icon
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18
echo "  ✓ Menu bar configured"

# ── Trackpad ──────────────────────────────────────
echo "  → Configuring trackpad..."
# Disable natural scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
echo "  ✓ Trackpad configured"

# ── Dock ──────────────────────────────────────────
echo "  → Configuring dock..."
# Auto-hide and enable magnification
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
echo "  ✓ Dock configured"

# ── Hot Corners ───────────────────────────────────
echo "  → Configuring hot corners..."
# Top left -> mission control
defaults write com.apple.dock wvous-tl-corner -int 2
# Top right -> desktop
defaults write com.apple.dock wvous-tr-corner -int 4
echo "  ✓ Hot corners configured"

# ── Apply Changes ─────────────────────────────────
echo "  → Restarting affected services..."
killall SystemUIServer
killall Dock
echo "  ✓ Services restarted"
echo ""
echo "  ℹ️  You may need to log out and back in for all changes to take effect."
echo ""
