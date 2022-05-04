fterm = require('FTerm')


vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, {bang = true})

vim.keymap.set('n', '<A-w>', '<CMD>FTermToggle<CR>')
vim.keymap.set('t', '<A-w>', '<C-\\><C-n><CMD>FTermToggle<CR>')
