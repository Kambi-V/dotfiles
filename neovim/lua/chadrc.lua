-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.base46 = {
  theme = "solarized_light",

  theme_toggle = { "solarized_light", "solarized_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.ui = {
  statusline = {
    enabled = true,
    theme = "default",
    separator_style = "arrow",
  },
  tabufline = {
    -- show_numbers = true,
    lazyload = true,
    enabled = true,
  },
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.3, ["bo sp"] = 0.3, ["bo vsp"] = 0.3 },
}

return M
