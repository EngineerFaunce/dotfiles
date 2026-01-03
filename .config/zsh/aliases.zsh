# For a full list of active aliases, run `alias`.

# quick access to configs
alias zshconfig="hx $HOME/.zshrc"
alias hxconfig="hx $HOME/.config/helix/config.toml"
alias wezconfig="hx $HOME/.config/wezterm/wezterm.lua"

# safer coreutils
alias rm="rm -Iv"
alias mv="mv -i"
alias freec="free -h | bat -l cpuinfo -p"

# quality of life
alias ls="eza -h --color=auto --group-directories-first"
alias la="eza -lah --color=auto --all --git --group-directories-first"
alias lsbc="lsblk | bat -l conf -p"
alias cat="bat"
# Because of a name clash in debian based distros
if command -v batcat >/dev/null 2>&1; then
  alias bat="batcat" 
fi
alias shell="exec $SHELL -l"
tf() { mkdir -p "$(dirname "$1")" && touch "$1" ; }

