#!/bin/bash

source ./src/env.sh

create_symlinks() {
  gum style --foreground "$HEX_HL1" --bold "Great! Updating home directory"

  # Clear all existing symlinks
  for file in "$HOME"/.*; do
    dotfile="$(basename "$file")"

    # If dotfile is in the exclude list, skip it
    if [[ ! " ${exclude_dotfiles[@]} " =~ " ${dotfile} " ]]; then
      rm -rf "$HOME/$dotfile"
    fi
  done

  for file in "$dir_dotfile_storage"/.*; do
    dotfile="$(basename "$file")"

    # If dotfile is in the exclude list, skip it
    if [[ " ${exclude_dotfiles[@]} " =~ " ${dotfile} " ]]; then
      continue
    fi

    # create symlink
    ln -sf "$dir_dotfile_storage/$dotfile" "$HOME"
    # print created symlink
    echo -n "$(gum style --foreground "$HEX_FG1" "$dir_dotfile_storage/")"
    echo -n "$(gum style --foreground "$HEX_HL2" "$dotfile")"
    echo -n "$(gum style --foreground "$HEX_HL1" "  ")"
    echo -n "$(gum style --foreground "$HEX_FG1" "$HOME/")"
    echo "$(gum style --foreground "$HEX_HL2" "$dotfile")"
  done
}
create_symlinks
