#!/bin/bash
#|--| ALL SCRIPTS ARE EXECUTED FROM THIS MAIN SCRIPT |--|#

# Load Config
source ./src/env.sh
# Home Section
main() {
  gum style --border normal --margin "1" --padding "1 2" --align "center" --border-foreground "$HEX_HL2" "Welcome to $(gum style --foreground "$HEX_HL1" 'ODM')!" "The first Dotfile Manager, that doesn't suck."
  # Action Variables
  INIT="ODM Initialization (First Time Setup)"
  UPDATE="Update Dotfiles (Storage -> Home)"
  # STATUS="Show Status"
  # GIT=".."
  # STORAGE="Dotfile Storage"
  # HOMEDIR="Home Directory"
  # Prompt User for Action
  ACTION=$(gum choose --item.foreground "$HEX_FG1" --cursor.foreground "$HEX_HL1" --cursor " " "$INIT" "$UPDATE")

  # Action: Init Script
  if [ "$ACTION" == "$INIT" ]; then
    bash ./src/actions/init.sh
  # Action: Dotfile Storage
  elif [ "$ACTION" == "$UPDATE" ]; then
    bash ./src/actions/update.sh
  fi
}
main
