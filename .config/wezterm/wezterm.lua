local wezterm = require('wezterm')
local mux = wezterm.mux
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

wezterm.on("gui-startup", function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn in our initial window
  local args = {}
  if cmd then
    args = cmd.args
  end

  -- str0m workspace
  local project_dir = wezterm.home_dir .. "/repos/str0m-intro"
  local tab, terminal_pane, window = wezterm.mux.spawn_window {
    workspace = "str0m",
    cwd = project_dir,
    args = args,
  }
  window:gui_window():maximize()
  local editor_pane = terminal_pane:split {
    direction = "Top",
    size = 0.9,
    cwd = project_dir,
  }

  mux.set_active_workspace "str0m"
end)

return config
