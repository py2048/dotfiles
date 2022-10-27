-- local present1, nvim_lsp = pcall(require, "lspconfig")

-- if not present1 then
--    return
-- end

local nvim_lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
--

-- Turn on lsp
vim.api.nvim_set_keymap("n", "<leader>s", ":LspStart<CR>:echo 'Lsp started'<CR>", {silent=true})