#!/bin/sh
# env vars to set on login, zsh settings in ~/.config/zsh/.zshrc

export PATH="$PATH:/home/fonz/.local/bin"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"

export EDITOR="hx"

# source additional (secret) environment variables
for f in $XDG_CONFIG_HOME/zsh/.env.d/*.zsh(N); do
  source "$f"
done

