zmodload zsh/complist
autoload -U compinit && compinit -d "$ZSH_COMPDUMP"
autoload -U colors && colors


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git ssh-agent rust)

zle -N menu-search
zle -N recent-paths

# Allow Ctrl-z to toggle between suspend and resume (Helix editor)
function Resume {
  fg
  zle push-input
  BUFFER=""
  zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

source $ZSH/oh-my-zsh.sh

### Options - run `man zshoptions` for more information ###

# Disable all beeps
setopt NO_BEEP
unsetopt LIST_BEEP
unsetopt HIST_BEEP

# History preferences
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

### Params - run `man zshparam` for more information ###

# history opts
HISTORY_IGNORE="(\&|[bf]g|c|clear|history|exit|q|pwd|* --help)"
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache

# Pure prompt
# TODO: make this path configurable
fpath+=($HOME/repos/tools/pure)
autoload -U promptinit; promptinit
prompt pure

# Initialize zoxide and alias `cd` to it
eval "$(zoxide init --cmd cd zsh)"

# source aliases
[ -f "$XDG_CONFIG_HOME/zsh/aliases.zsh" ] && source "$XDG_CONFIG_HOME/zsh/aliases.zsh"

# source additional, untracked aliases
for f in $XDG_CONFIG_HOME/zsh/.zshrc.d/*.zsh(N); do
  source "$f"
done
