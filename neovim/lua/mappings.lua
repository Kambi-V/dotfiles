require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- -- overwriting the same lines in NvChad mapping file, in order to add `async = true`
-- map("n", "<leader>fm", function()
--   require("conform").format({ async = true, lsp_fallback = true })
-- end, { desc = "custom format files" })
