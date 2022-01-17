-- local present1, nvim_lsp = pcall(require, "lspconfig")

-- if not present1 then
--    return
-- end

local nvim_lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.ccls.setup {
  capabilities = capabilities,
  autostart = false
}

require'lspconfig'.pyright.setup {
  capabilities = capabilities,
  autostart = false
}

require'lspconfig'.julials.setup{
  capabilities = capabilities,
  autostart = false
}

-- require'lspconfig'.bashls.setup {
--   capabilities = capabilities,
-- }
