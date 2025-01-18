---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "solarized_dark",
  theme_toggle = { "solarized_dark", "solarized_dark" },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    show_numbers = true,
    lazyload = true,
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"
return M
