zmodload zsh/complist
autoload -U compinit && compinit -d "$ZSH_COMPDUMP"
autoload -U colors && colors

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

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved

# Pure prompt
fpath+=($HOME/repos/pure)
autoload -U promptinit; promptinit
prompt pure

eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# source aliases
[ -f "$XDG_CONFIG_HOME/zsh/aliases.zsh" ] && source "$XDG_CONFIG_HOME/zsh/aliases.zsh"

# source additional, untracked aliases
for f in $XDG_CONFIG_HOME/zsh/.zshrc.d/*.zsh(N); do
  source "$f"
done
