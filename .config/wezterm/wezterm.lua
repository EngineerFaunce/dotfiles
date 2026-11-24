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
config.color_scheme = 'Dracula'
config.window_background_opacity = 1.0

-- Miscellaneous settings
config.max_fps = 120
config.audible_bell = "Disabled"

-- Key bindings
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- quickly launch editor for wezterm configuration
  {
    key = ",",
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { 'hx', wezterm.config_file },
    },
  },
  -- Choose a workspace to switch to
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
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
  -- Open lazygit
  {
    key = 'g',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = { 'lazygit' },
    },
  }
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_domain = "WSL:Ubuntu"
  config.wsl_domains = {
    {
      name = "WSL:Ubuntu",
      distribution = "Ubuntu",
      default_cwd = "~"
    },
  }
end

return config
