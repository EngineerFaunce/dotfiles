local wezterm = require('wezterm')
local config = wezterm.config_builder()
local projects = require 'projects'

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
config.window_background_opacity = 0.8

-- Miscellaneous settings
config.max_fps = 120

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
  -- Open a project in a new workspace
  {
    key = 'p',
    mods = 'LEADER',
    action = projects.choose_project(),
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
}


wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window {
    workspace = "home",
    cwd = wezterm.home_dir,
    args = cmd and cmd.args or {},
  }
  window:gui_window():maximize()
end)

config.default_workspace = "home"

return config
