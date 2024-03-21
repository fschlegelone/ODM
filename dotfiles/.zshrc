# --| STARTUP --| #

# --| FUNCTIONS --| #
function ppath() {
  echo "Path Variable:"
  echo "$PATH" | tr ':' '\n'
}
function chinfo() {
  echo "$(stat -f '%U:%G' $1)"
}

# --| PYENV |-- #
eval "$(pyenv init --path)"

# --|  LLVM (C Compiler) |-- #
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# --| PNPM |-- #
export PNPM_HOME="$HOME/Library/pnpm" # set PNPM_HOME
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --| STARSHIP SHELL PROMPT |-- #
eval "$(starship init zsh)"

# --| VISUAL STUDIO CODE |-- #
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"


# --| ALIAS DEFINITIONS |-- #
alias py="python"
alias nv="nvim"
alias ff="fastfetch"
alias br="brew"
alias cl="clear"
alias md="mkdir"
alias mf="touch"

# --| GNU UTILITIES ALIASE |-- #
alias chroot="gchroot"
alias dirname="gdirname"
alias head="ghead"
alias mkdir="gmkdir"
alias paste="gpaste"
alias rmdir="grmdir"
alias sort="gsort"
alias timeout="gtimeout"
alias uptime="guptime"
alias b2sum="gb2sum"
alias cksum="gcksum"
alias du="gdu"
alias hostid="ghostid"
alias mkfifo="gmkfifo"
alias pathchk="gpathchk"
alias runcon="gruncon"
alias split="gsplit"
alias touch="gtouch"
alias users="gusers"
alias base32="gbase32"
alias comm="gcomm"
alias echo="gecho"
alias id="gid"
alias mknod="gmknod"
alias pinky="gpinky"
alias seq="gseq"
alias stat="gstat"
alias tr="gtr"
alias vdir="gvdir"
alias base64="gbase64"
alias cp="gcp"
alias env="genv"
alias install="ginstall"
alias mktemp="gmktemp"
alias pr="gpr"
alias sha1sum="gsha1sum"
alias stdbuf="gstdbuf"
alias true="gtrue"
alias wc="gwc"
alias basename="gbasename"
alias csplit="gcsplit"
alias expand="gexpand"
alias join="gjoin"
alias mv="gmv"
alias printenv="gprintenv"
alias sha224sum="gsha224sum"
alias stty="gstty"
alias truncate="gtruncate"
alias who="gwho"
alias basenc="gbasenc"
alias cut="gcut"
alias expr="gexpr"
alias kill="gkill"
alias nice="gnice"
alias printf="gprintf"
alias sha256sum="gsha256sum"
alias sum="gsum"
alias tsort="gtsort"
alias whoami="gwhoami"
alias cat="gcat"
alias date="gdate"
alias factor="gfactor"
alias link="glink"
alias nl="gnl"
alias ptx="gptx"
alias sha384sum="gsha384sum"
alias sync="gsync"
alias tty="gtty"
alias yes="gyes"
alias chcon="gchcon"
alias dd="gdd"
alias false="gfalse"
alias ln="gln"
alias nohup="gnohup"
alias pwd="gpwd"
alias sha512sum="gsha512sum"
alias tac="gtac"
alias uname="guname"
alias chgrp="gchgrp"
alias df="gdf"
alias fmt="gfmt"
alias logname="glogname"
alias nproc="gnproc"
alias readlink="greadlink"
alias shred="gshred"
alias tail="gtail"
alias unexpand="gunexpand"
alias chmod="gchmod"
alias dir="gdir"
alias fold="gfold"
alias ls="gls"
alias numfmt="gnumfmt"
alias realpath="grealpath"
alias shuf="gshuf"
alias tee="gtee"
alias uniq="guniq"
alias chown="gchown"
alias dircolors="gdircolors"
alias groups="ggroups"
alias md5sum="gmd5sum"
alias od="god"
alias rm="grm"
alias sleep="gsleep"
alias test="gtest"
alias unlink="gunlink"
alias tar="gtar"       # gnu-tar package
alias sed="gsed"       # gnu-sed package
alias indent="gindent" # gnu-indent package
alias which="gwhich"   # gnu-which package
