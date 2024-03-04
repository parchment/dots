-- Set version for compatibility
version = "0.21.3"

-- Current focus
xplr.config.general.focus_ui.prefix = ">  "
xplr.config.general.focus_ui.suffix = ""

xplr.config.general.show_hidden = true
xplr.config.general.enable_mouse = true

-- Set layout
xplr.config.layouts.builtin.default = {
  Vertical = {
    config = {
      constraints = {
        { Min = 1 },
        { Length = 2 },
      },
    },
    splits = {
      "Table",
    },
  },
}

-- Set column headers
xplr.config.general.table.header.cols = {
  { format = " index",           style = {} },
  { format = " size",            style = {} },
  { format = " path",            style = {} },
}

-- Set columns
xplr.config.general.table.row.cols = {
  {
    format = "builtin.fmt_general_table_row_cols_0",
    style = {},
  },
  {
    format = "builtin.fmt_general_table_row_cols_1",
    style = {},
  },
    {
    format = "builtin.fmt_general_table_row_cols_2",
    style = {},
  },
}

-- Set column widths
xplr.config.general.table.col_widths = {
  { Percentage = 10 },
  { Percentage = 10 },
  { Percentage = 80 },
}

xplr.fn.builtin.fmt_general_table_row_cols_1 = function(m)
  if not m.is_dir then
    return m.human_size
  else
    return ""
  end
end

xplr.fn.builtin.fmt_general_table_row_cols_2 = function(m)
  local nl = xplr.util.paint("\\n", { add_modifiers = { "Italic", "Dim" } })
  local r = m.tree .. m.prefix
  local style = xplr.util.lscolor(m.absolute_path)
  style = xplr.util.style_mix({ style, m.style })

  if m.meta.icon == nil then
    r = r .. ""
  else
    r = r .. m.meta.icon .. " "
  end

  local rel = m.relative_path
  if m.is_dir then
    rel = rel .. "/"
  end
  r = r .. xplr.util.paint(xplr.util.shell_escape(rel), style)

  r = r .. m.suffix .. " "

  if m.is_symlink then
    r = r .. "-> "

    if m.is_broken then
      r = r .. "×"
    else
      local symlink_path =
          xplr.util.shorten(m.symlink.absolute_path, { base = m.parent })
      if m.symlink.is_dir then
        symlink_path = symlink_path .. "/"
      end
      r = r .. symlink_path:gsub("\n", nl)
    end
  end

  return r
end

-- Set table icons
xplr.config.node_types.directory.meta.icon = nil
xplr.config.node_types.file.meta.icon = nil

-- Set table styles
xplr.config.general.table.tree = {
  { format = "", style = {} },
  { format = "", style = {} },
  { format = "", style = {} },
}

-- Remove borders
xplr.config.general.panel_ui.default.borders = {}

-- Highlight selection
xplr.config.general.selection_ui.style = {
  fg = "Yellow",
  add_modifiers = {},
}
-- Focus + selection
xplr.config.general.focus_selection_ui.style = {
  add_modifiers = { "Bold" },
}
