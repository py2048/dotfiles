vim.api.nvim_create_user_command('LatexSymbols', function()
    -- table.insert(require('cmp').get_config().sources, { name = 'latex_symbols' })
    table.insert(require('cmp.config').global.sources, { name = 'latex_symbols' })

    print('latex_symbols loaded')
end, { bang = true })

vim.api.nvim_set_keymap("n", "<leader>t", ":LatexSymbols<CR>", {silent=true, noremap=true})


