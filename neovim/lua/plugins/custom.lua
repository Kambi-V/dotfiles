local overrides = require "custom.configs.overrides"

return {
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   lazy = false,
  -- },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "lua-language-server",
  --       "stylua",
  --       -- "pyright",
  --       -- "debugpy",
  --       -- "mypy",
  --       -- "ruff",
  --       -- "black",
  --
  --       -- devops
  --       "dockerfile-language-server",
  --       "yaml-language-server",
  --       "yamlfmt",
  --
  --       -- web
  --       "css-lsp",
  --       "stylelint-lsp",
  --       "html-lsp",
  --       "typescript-language-server",
  --       "eslint_d",
  --       "eslint-lsp",
  --       -- "deno",
  --       "prettierd",
  --       "svelte-language-server",
  --       "tailwindcss-language-server",
  --       "vue-language-server",
  --
  --       "shfmt",
  --       -- c/cpp stuff
  --       -- "clangd",
  --       -- "clang-format",
  --
  --       --backend
  --       -- "ocaml-lsp",
  --       -- "haskell-language-server",
  --     },
  --   },
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },
}
