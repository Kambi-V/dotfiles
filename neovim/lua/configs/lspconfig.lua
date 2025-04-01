-- load defaults i.e lua_lsp
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

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

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- If you are using mason.nvim, you can get the ts_plugin_path like this
local mason_registry = require "mason-registry"
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"
-- local svelte_language_server_path = mason_registry.get_package("svelte-language-server"):get_install_path()
--   .. "/node_modules/typescript-svelte-plugin"

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
      },
      -- {
      --   name = "typescript-svelte-plugin",
      --   location = svelte_language_server_path,
      --   languages = { "svelte" },
      -- },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "svelte" },
}

lspconfig.volar.setup {}

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
lspconfig.eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  -- filetypes = {
  --   "javascript",
  --   "javascriptreact",
  --   "javascript.jsx",
  --   "typescript",
  --   "typescriptreact",
  --   "typescript.tsx",
  --   "vue",
  --   "svelte",
  --   "astro",
  -- },
  -- root_dir = function(fname)
  --   root_file = util.insert_package_json(root_file, "eslintConfig", fname)
  --   return util.root_pattern(unpack(root_file))(fname)
  -- end,
}

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
