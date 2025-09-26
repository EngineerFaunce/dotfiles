#!/bin/sh
# env vars to set on login, zsh settings in ~/.config/zsh/.zshrc

export PATH="$PATH:/home/fonz/.local/bin"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

