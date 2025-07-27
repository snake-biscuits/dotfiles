local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1.00

config.font = wezterm.font_with_fallback {
    "Fira Code",
    -- NOTE: install "ttf-nerd-fonts-symbols" for more glyphs
}

-- keybinds
config.keys = {
    { mods = "CTRL|ALT", key = "w",
      action = wezterm.action.CloseCurrentTab { confirm = true }, },
}

return config
