local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "svelte",
    -- "c",
    "markdown",
    "markdown_inline",
    "vue",
    "fish",
    "gitignore",
    "graphql",
    "http",
    "sql",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
