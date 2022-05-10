fterm = require('FTerm')

-- Float Terminal
vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, {bang = true})

vim.keymap.set('n', '<A-w>', '<CMD>FTermToggle<CR>')
vim.keymap.set('t', '<A-w>', '<C-\\><C-n><CMD>FTermToggle<CR>')

-- Code runner
vim.api.nvim_create_user_command('CodeRun', function()
    fterm.scratch({cmd = {'run.sh', vim.fn.expand('%')}})
end, { bang = true })

vim.keymap.set('n', '<leader>r', '<CMD>up<CR>:CodeRun<CR>')
