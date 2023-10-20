local M = {}

M.config = function()
  local metals_config = require("metals").bare_config()
  metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
  metals_config.settings = {
    superMethodLensesEnabled = true,
    showImplicitArguments = true,
    showInferredType = true,
    showImplicitConversionsAndClasses = true,
    excludedPackages = {},
  }
  metals_config.init_options.statusBarProvider = "on"
  return metals_config
end

return M
