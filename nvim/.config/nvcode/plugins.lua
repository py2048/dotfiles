require('eyeliner').setup {
    highlight_on_key = true,
}
vim.api.nvim_set_hl(0, 'eyelinerprimary', { fg='#d4bfff', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'eyelinersecondary', { fg='#ffcc66', bold = true, underline = true })
