local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.ccls.setup {
  capabilities = capabilities,
  autostart = false
}

nvim_lsp.pyright.setup {
  capabilities = capabilities,
  autostart = false
}

nvim_lsp.julials.setup{
  capabilities = capabilities,
  autostart = false
}

-- nvim_lsp.bashls.setup {
--   capabilities = capabilities,
-- }
--

-- Diagnostic
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    virtual_text = {
        prefix = '●'
    },
    signs = {
        active = signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
}
vim.diagnostic.config(config)

-- Turn on lsp
vim.api.nvim_set_keymap("n", "<leader>s", ":LspStart<CR>:echo 'Lsp started'<CR>", {silent=true})
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
