local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local eslint = require "custom.eslint"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "dockerls", "yamlls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}
-- lspconfig for svelte
lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- ft = {
  -- "svelte",
  -- },
  -- cmd = { "svelteserver", "--stdio" },
  -- root_dir = lspconfig.util.root_pattern("package.json", ".git"),
}

--lspconfig for tailwindcss
lspconfig.tailwindcss.setup {}

lspconfig.volar.setup {}

lspconfig.eslint.setup {
  cmd = { "vscode-eslint-language-server", "--stdio" },
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

lspconfig.yamlls.setup {}

lspconfig.dockerls.setup {}

lspconfig.java_language_server.setup {}

-- lspconfig.denols.setup {}
