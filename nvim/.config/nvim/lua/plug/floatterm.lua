local fterm = require('FTerm')

-- Float Terminal
vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, {bang = true})

vim.keymap.set('n', '<A-w>', '<CMD>FTermToggle<CR>')
vim.keymap.set('t', '<A-w>', '<C-\\><C-n><CMD>FTermToggle<CR>')

-- Code runner
vim.api.nvim_create_user_command('CodeRun', function()
    fterm.scratch({cmd = {'run.sh', vim.fn.expand('%')}})
end, { bang = true })

vim.keymap.set('n', '<leader>r', '<CMD>up<CR>:CodeRun<CR>')

-- Lf
local lf = fterm:new({
    cmd = {'lf', '-config', os.getenv('HOME') .. '/.config/lf/nvim-terminal/lfrc'},
    auto_close = true
})

vim.api.nvim_create_user_command('Lf', function() lf:open() end, {bang = true})
vim.api.nvim_create_user_command('LfExit', function() lf:close(true) end, {bang = true})
vim.api.nvim_set_keymap("n", "<leader>l", ":Lf<CR>", {silent=true})
