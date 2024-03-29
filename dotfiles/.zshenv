# ------------- #
#   ~/.zshenv   #
# ------------- #

# user config home
export XDG_CONFIG_HOME="$HOME/.config"

# pyenv


export PYENV_ROOT="$HOME/.pyenv"

# node version manager home
# export NVM_DIR="$HOME/.config/nvm"

# load cargo .env file
# source "$HOME/.cargo/env"

# set vars for curl
export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/curl/include"

# gnu manpath
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# --------------- #
#  PATH VARIABLES #
# --------------- #

# HOMEBREW BINARIES
PATH="/opt/homebrew/bin:$PATH"
PATH="/opt/homebrew/sbin:$PATH"

# rust cargo environment
PATH="$HOME/.cargo/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"

export PATH
