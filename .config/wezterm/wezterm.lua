local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- Font settings
config.font_size = 10
config.line_height = 1.2
config.font = wezterm.font_with_fallback {
  'Fira Code',
  'JetBrains Mono'
}

-- Colors
config.colors = {
  cursor_bg = "white",
  cursor_border = "purple",
}

-- Appearance
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = 'Dracula'
config.window_background_opacity = 0.8

-- Miscellaneous settings
config.max_fps = 120

-- Key bindings
config.keys = {
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

return config
