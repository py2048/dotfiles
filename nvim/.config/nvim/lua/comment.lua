-- require('nvim_comment').setup({
--     marker_padding = true,
--     comment_empty = false,
--     create_mappings = false,
-- })

require('kommentary.config').configure_language("default", {
    prefer_single_line_comments = true,
})
vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("x", "<leader>/", "<Plug>kommentary_visual_default", {})
