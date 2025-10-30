return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    cmd = "ConformInfo",
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
    tag = "v1.2", -- You can select a tagged version
  },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "shfmt",
        "shellcheck",
        "astro-language-server",
        "bash-language-server",

        -- devops
        "dockerfile-language-server",
        "yaml-language-server",
        "yamlfmt",
        "ada-language-server",
        -- web
        "css-lsp",
        "stylelint-lsp",

        -- "stylelint",
        "html-lsp",
        "typescript-language-server",
        "eslint_d",
        "eslint-lsp",
        -- "deno",
        "prettierd",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vue-language-server",
        "vtsls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "shfmt",
        "shellcheck",
        "astro-language-server",
        "bash-language-server",

        -- devops
        "dockerfile-language-server",
        "yaml-language-server",
        "yamlfmt",
        "ada-language-server",
        -- web
        "css-lsp",
        "stylelint-lsp",

        -- "stylelint",
        "html-lsp",
        "typescript-language-server",
        "eslint_d",
        "eslint-lsp",
        -- "deno",
        "prettierd",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vue-language-server",
        "vtsls",
      },
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    ft = { "typescriptreact", "vue", "svelte" },
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }

      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
          or get_option(filetype, option)
      end
    end,
  },
}
