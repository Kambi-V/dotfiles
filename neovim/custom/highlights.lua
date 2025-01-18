-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  Boolean = {
    italic = true,
  },
  -- imports
  Include = {
    italic = true,
  },
  -- for, while loops
  Repeat = {
    italic = true,
  },
  -- if statements
  Conditional = {
    italic = true,
  },
  -- variables
  -- ["@variable"] = {
  --   italic = true,
  -- },
  -- class, with, as keywords
  ["@keyword"] = {
    italic = true,
  },
  -- function keyword
  ["@keyword.function"] = {
    italic = true,
  },
  -- return, yield keywords
  -- ["@keyword.return"] = {
  --   italic = true,
  -- },
  -- function names
  -- ["@function"] = {
  --   italic = false,
  -- },
  -- symbolic
  -- ["@operator"] = {
  --   italic = true,
  -- },
  -- logical keywords
  ["@keyword.operator"] = {
    italic = true,
  },
  -- function parameters
  ["@parameter"] = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
