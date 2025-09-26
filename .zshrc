# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git fast-syntax-highlighting rust)

zle -N menu-search
zle -N recent-paths

source $ZSH/oh-my-zsh.sh

# Pure prompt
fpath+=($HOME/repos/pure)
autoload -U promptinit; promptinit
prompt pure

# User configuration

export PATH="$PATH:/home/fonz/.local/bin"

# For a full list of active aliases, run `alias`.
alias zshconfig="hx $HOME/.zshrc"
alias hxconfig="hx $HOME/.config/helix/config.toml"
alias wezconfig="hx $HOME/.config/wezterm/wezterm.lua"
alias ls="eza -h --color=auto --group-directories-first"
alias la="eza -lah --color=auto --all --git --group-directories-first"
alias lsbc="lsblk | bat -l conf -p"
alias cat="bat"
alias bat="batcat" # Because of a name clash
alias shell="exec $SHELL -l"
alias rm="rm -Iv"
alias mv="mv -i"
alias freec="free -h | bat -l cpuinfo -p"

eval "$(zoxide init --cmd cd zsh)"



