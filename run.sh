#!/bin/bash

#|--| VARIABLES |--|#
# colors
readonly HEX_HL1="#CBA6F7"     # Color Highlight 1
readonly HEX_HL2="#74C7EC"     # Color Highlight 3
readonly HEX_ERROR="#F38BA8"   # Color Error
readonly HEX_SUCCESS="#A6E3A1" # Color Success
readonly HEX_FG1="#CDD6F4"     # Text Color
readonly HEX_FG2="#A6ADC8"     # Text Color Secondary
# repo dir
dir_repo_root=$(git rev-parse --show-toplevel)
# $home dir
dir_odm="$HOME/ODM"
# repo dotfile storage
dir_dotfile_storage="$dir_repo_root/dotfiles"
# dotfile storage backup
dir_dotfile_storage_backup="$dir_odm/dotfile_storage_backup"

# dotfiles exclude list
exclude_dotfiles=(
    "."
    ".."
    ".terminfo"
    ".DS_Store" # MacOS auto generated cache file
    ".wget-hsts"
    ".Trash"
    ".bash_history"
    ".zsh_history"
    ".node_repl_history"
    ".python_history"
    ".cache"
    ".ssh"
    ".gnupg"
    ".wget-hsts"  # Wget
    ".local"      # User installed programs
    ".pyenv"      # Python
    ".npm"        # Node Package Manager
    ".cargo"      # Rust
    ".gem"        # Ruby
    ".pnpm-state" # PNPM (npm enhancement)
    ".rustup"     # Rust
    ".zcompdump"
)

#|--| INITILIZATION |--|#
init_permissions() {
    repo_root=$(git rev-parse --show-toplevel)
    echo "Setting script permissions... Sudo required."
    sudo chmod 744 $repo_root/src/*.sh
}

# Check for operating system & package manager
init_check_os() {
    os=$(uname -s)
    # Linux ?
    if [[ "$os" == "Linux" ]]; then
        echo "Linux"
        # Check for package manager
        case "$(true)" in
        # APT
        $(command -v apt &>/dev/null))
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
            echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
            sudo apt update && sudo apt install gum
            ;;
        # Pacman
        $(command -v pacman &>/dev/null))
            pacman -S gum
            ;;
        # NIX
        $(command -v nix &>/dev/null))
            nix-env -iA nixpkgs.gum
            ;;
        *)
            # Unsupported package manager
            echo "Damn. Automated setup on Linux is only available for apt, dnf and pacman. You're on your own."
            ;;
        esac
    # MacOS ?
    elif [[ "$os" == "Darwin" ]]; then
        # Brew installed?
        if command -v brew &>/dev/null; then
            echo "Great. Homebrew is installed"
        else
            echo "Damn. Homebrew is not installed. No worries, installing it now..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        # Gum installed?
        if [ $(brew list | grep "gum") ]; then
            echo "Great. Gum is installed"
        else
            echo "Damn. Gum is not installed. No worries, installing it now..."
            brew install gum
        fi
    else
        echo "Damn. Unknown operating system. Windows is not supported btw."
    fi
}

sync() {
  gum style --foreground "$HEX_HL1" --bold "Great! Syncing your Home Directory with the Dotfile Storage."

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

  # Action: Initialize
  if [ "$ACTION" == "$INIT" ]; then
  init_permissions # "$@"
  init_check_os # "$@"
  # Action: Update Symlinks
  elif [ "$ACTION" == "$UPDATE" ]; then
    sync # "$@"
  fi
}
main
