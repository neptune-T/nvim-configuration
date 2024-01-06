-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.nightfly")

-- new colors for theme
local new_colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000",
  uiuc_blue = "#13294B",
  uiuc_orange = "#E84A27",
}

-- change nightlfy theme colors
lualine_nightfly.normal.a.bg = new_colors.blue
lualine_nightfly.insert.a.bg = new_colors.uiuc_orange
lualine_nightfly.visual.a.bg = new_colors.violet
lualine_nightfly.command.a.bg = new_colors.yellow
lualine_nightfly.command.a.fg = new_colors.black

-- configure lualine with modified theme and options from the second configuration
lualine.setup({
  options = {
    icons_enabled = true,
    theme = lualine_nightfly,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
      "branch",
      "diff",
      --{"diagnostics", sources = {"nvim_lsp"}}
    },
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}, symbols = {error = " ", warn = " ", info = " ", hint = " "}},
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})

