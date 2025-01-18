local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local eslint = require "custom.eslint"

-- if you just want default config for the servers then put them in a table
local servers =
  { "html", "cssls", "ts_ls", "clangd", "dockerls", "yamlls", "volar", "svelte", "pyright", "tailwindcss", "mojo" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.svelte.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- }
--
-- lspconfig.tailwindcss.setup {}
--
-- lspconfig.mojo.setup {}
--
-- lspconfig.volar.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

lspconfig.eslint.setup {
  on_attach = on_attach,
  root_dir = util.root_pattern(
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.cjs",
    ".eslintrc.yaml",
    ".eslintrc.yml",
    ".eslintrc.json",
    "eslint.config.js"
  ),
}
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

-- lspconfig.yamlls.setup {}

-- lspconfig.dockerls.setup {}

-- lspconfig.java_language_server.setup {}
-- lspconfig.kotlin_language_server.setup {}

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
