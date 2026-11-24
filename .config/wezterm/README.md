
# Note regarding WezTerm configuration on Windows

The following environment variable should be used to load the WezTerm configuration file from a WSL path:

| Key | Value |
|-----|-------|
| WEZTERM_CONFIG_FILE | `\\wsl$\<distro>\home\<wsl_username>\.dotfiles\.config\wezterm\wezterm.lua` |