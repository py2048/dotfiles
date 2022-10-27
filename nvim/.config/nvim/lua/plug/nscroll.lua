require('neoscroll').setup({
    easing_function = "sine" -- Default easing function   -- Set any options as needed
})

-- Syntax scrolling function: `scroll(lines, move_cursor, time[, easing_function_name])`
local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '75'}}
t['<C-d>'] = {'scroll', { 'vim.wo.scroll', 'true', '75'}}
t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '150'}}
t['<C-f>'] = {'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '150'}}
t['<C-y>'] = {'scroll', {'-0.10', 'true', '75'}}
t['<C-e>'] = {'scroll', { '0.10', 'true', '75'}}
t['<C-A-k>'] = {'scroll', {'-0.2', 'true', '30'}}
t['<C-A-j>'] = {'scroll', { '0.2', 'true', '30'}}
t['zt']    = {'zt', {'75'}}
t['zz']    = {'zz', {'75'}}
t['zb']    = {'zb', {'75'}}

require('neoscroll.config').set_mappings(t)
