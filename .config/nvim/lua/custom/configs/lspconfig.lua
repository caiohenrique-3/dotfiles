local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "tailwindcss", "intelephense", "clangd", "svelte", "pylsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.svelte.setup {
  capabilities = {
    documentFormattingProvider = true,
  },
}

lspconfig.pylsp.setup {
  capabilities = {
    documentFormattingProvider = true,
  },
}

--
-- lspconfig.pyright.setup { blabla}
