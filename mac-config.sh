#!/bin/bash

echo "Configuring macOS settings..."

# Show Bluetooth menu bar icon
defaults -currentHost write com.apple.controlcenter Bluetooth -int 18

# Disable natural scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable trackpad tap to click (for current user)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Automatically hide and show the dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true

# Restart affected services to apply changes immediately
killall SystemUIServer
killall Dock

echo "Done. You may need to log out and back in for all changes to take effect."