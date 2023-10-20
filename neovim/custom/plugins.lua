local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "junegunn/fzf",
  },
  {
    "akinsho/flutter-tools.nvim",
    -- lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {}
    end,
    ft = { "dart" },
  },
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
    init = function()
      vim.g.dart_format_on_save = 1
      vim.g.dartfmt = "dartfmt --fix --line-length 80"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  },
  {
    "MunifTanjim/prettier.nvim",
    event = "VimEnter",
  },
  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      overrides.mason,
      ensure_installed = {
        "rust-analyzer",
        "stylua",
        "pyright",
        "debugpy",
        "mypy",
        "ruff",
        "black",
        --production
        "dockerfile-language-server",
        "yaml-language-server",
        "yamlfmt",
        --web
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "eslint_d",
        "eslint-lsp",
        -- "deno",
        "prettierd",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vue-language-server",

        --backend
        "java-language-server",
        "kotlin-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- https://github.com/scalameta/nvim-metals/issues/601
  -- https://github.com/NvChad/NvChad/issues/2352
  {
    "scalameta/nvim-metals",
    opt = true,
    ft = { "scala", "sbt" },
    requires = { "nvim-lua/plenary.nvim" },
    -- config = function()
    --   require("metals").initialize_or_attach { metals_helloworld = false, ["metals.formatOnSave"] = true }
    -- end,
    init = function()
      local metals_config = require("custom.configs.scala").config()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = vim.api.nvim_create_augroup("nvim-metals", { clear = true }),
      })
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },

  {
    "saecki/crates.nvim",
    ft = {
      "rust",
      "toml",
    },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
