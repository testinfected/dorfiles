-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- tic -x -o ~/.terminfo ~/.config/wezterm/wezterm.terminfo
config.term = "wezterm"

-- This is where you actually apply your config choices
config.font = wezterm.font 'MesloLGS Nerd Font'
config.font_size = 13.0

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Macchiato" -- or Macchiato, Frappe, Latte

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.95
config.macos_window_background_blur = 8
config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '1cell',
  bottom = '1cell',
}

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config
