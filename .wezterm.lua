-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
  left = 20,
  right = 20,
  top = 10,
  bottom = 10,
}

config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 13.0
font_antialias = "Subpixel"
config.line_height = 1.1

config.colors = {
  foreground = '#FFFFFF',
  background = '#282529',
  ansi = {
      '#000000',
      '#E06682',
      '#A9DC76',
      '#FFD866',
      '#78DCE8',
      '#EE9D70',
      '#AB9DF2',
      '#C7C7C7',
  },
  brights = {
      '#C7C7C7',
      '#FF6188',
      '#A9DC76',
      '#FFD866',
      '#78DCE8',
      '#FC9867',
      '#AB9DF2',
      '#FFFFFF',
  },
  cursor_bg = '#FFD866',
  cursor_fg = 'black',
  cursor_border = '#FFD866',

  tab_bar = {
      active_tab = {
        bg_color = '#282529',
        fg_color = '#ffffff',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab_edge = '#282529',
      inactive_tab = {
          bg_color = '#282529',
          fg_color = '#808080',
      },
      inactive_tab_hover = {
          bg_color = '#282529',
          fg_color = '#A9DC76',
          italic = true,
      },
    },
 }
config.use_fancy_tab_bar = true
config.show_new_tab_button_in_tab_bar = false

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = pane.foreground_process_name

  return string.format("%d: %s", tab.tab_index + 1, basename(title))
end)

config.window_frame = {
    font = wezterm.font { family = 'Hack', weight = 'Bold' },
    font_size = 13.0,
    active_titlebar_bg = '#282529',
    inactive_titlebar_bg = '#282529',
}

return config