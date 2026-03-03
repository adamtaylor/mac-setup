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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

run_script() {
  local script="$1"
  if [[ -f "$SCRIPT_DIR/$script" ]]; then
    bash "$SCRIPT_DIR/$script"
  else
    echo "  ✗ ERROR: $script not found"
    exit 1
  fi
}

run_script "bootstrap.sh"
run_script "1password.sh"
run_script "mac-config.sh"

echo ""
echo "┌──────────────────────────────────────────────┐"
echo "│  ✅  All done! Restart your machine.         │"
echo "└──────────────────────────────────────────────┘"
