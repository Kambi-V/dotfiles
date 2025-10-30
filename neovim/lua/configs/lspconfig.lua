-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  -- "clangd",
  "dockerls",
  "yamlls",
  "svelte",
  "stylelint_lsp",
  "bashls",
  "astro",
  "tailwindcss",
}

vim.lsp.enable(servers)

local base_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not base_on_attach then
      return
    end

    base_on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})

vim.lsp.config("lua_ls", {
  root_dir = function(bufnr, on_dir)
    if not vim.fn.bufname(bufnr):match "%.txt$" then
      on_dir(vim.fn.getcwd())
    end
  end,
})

-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
-- .. "/node_modules/@vue/language-server"
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
-- .. "/node_modules/@vue/language-server"
-- For Mason v2,
-- local vue_language_server_path = vim.fn.expand "$MASON/packages"
-- .. "/vue-language-server"
-- .. "/node_modules/@vue/language-server"
-- or even
local vue_language_server_path = vim.fn.stdpath "data"
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

-- local svelte_language_server_path = mason_registry.get_package("svelte-language-server"):get_install_path()
--   .. "/node_modules/typescript-svelte-plugin"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
local vtsls_config = {
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = tsserver_filetypes,
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}
local vue_ls_config = {}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable { "vtsls", "vue_ls" } -- If using `ts_ls` replace `vtsls` to `ts_ls`

-- lspconfig.ts_ls.setup {
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = vue_language_server_path,
--         languages = { "vue" },
--       },
-- {
--   name = "typescript-svelte-plugin",
--   location = svelte_language_server_path,
--   languages = { "svelte" },
-- },
--     },
--   },
--   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
-- }

-- local customizations = {
--   { rule = "style/*", severity = "off", fixable = true },
--   { rule = "format/*", severity = "off", fixable = true },
--   { rule = "*-indent", severity = "off", fixable = true },
--   { rule = "*-spacing", severity = "off", fixable = true },
--   { rule = "*-spaces", severity = "off", fixable = true },
--   { rule = "*-order", severity = "off", fixable = true },
--   { rule = "*-dangle", severity = "off", fixable = true },
--   { rule = "*-newline", severity = "off", fixable = true },
--   { rule = "*quotes", severity = "off", fixable = true },
--   { rule = "*semi", severity = "off", fixable = true },
-- }

-- Enable eslint for all supported languages
-- lspconfig.eslint.setup {
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
--   -- on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   on_init = nvlsp.on_init,
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--     "vue",
--     "html",
--     "markdown",
--     "json",
--     "jsonc",
--     "yaml",
--     "toml",
--     "xml",
--     "gql",
--     "graphql",
--     "astro",
--     "css",
--     "svelte",
--     "less",
--     "scss",
--     "pcss",
--     "postcss",
--   },
--   settings = {
--     -- Silent the stylistic rules in you IDE, but still auto fix them
--     rulesCustomizations = customizations,
--   },
-- }
-- lspconfig.rust_analyzer.setup {
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "rust" },
--   root_dir = util.root_pattern "Cargo.toml",
--   settings = {
--     ["rust_analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- }

-- lspconfig.clangd.setup {
--   on_attach = function(client, bufnr)
--     client.server_capabilities.signatureHelpProvider = false
--     nvlsp.on_attach(client, bufnr)
--   end,
--   capabilities = nvlsp.capabilities,
-- }
