# dotfiles

```bash
# Symlink everything in the current directory into the home directory
stow .

# If the file already exists where stow is trying to create the symlink, pass the `--adopt` flag
# This will overwrite the dotfiles directory version with the "real" one
stow --adopt .
```
