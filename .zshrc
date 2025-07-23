# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

#source "$HOME/repos/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git fast-syntax-highlighting rust)

zle -N menu-search
zle -N recent-paths

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/home/fonz/.local/bin"

# For a full list of active aliases, run `alias`.
alias zshconfig="hx $HOME/.zshrc"
alias hxconfig="hx $HOME/.config/helix/config.toml"
alias wezconfig="hx $HOME/.config/wezterm/wezterm.lua"
alias ls="eza"
alias la="eza --all --git"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init --cmd cd zsh)"


