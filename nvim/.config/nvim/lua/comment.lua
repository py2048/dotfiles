local kmt = require('kommentary.config')

kmt.configure_language("default", {
    prefer_single_line_comments = true,
})

kmt.configure_language("julia", {
    single_line_comment_string = "#",
    multi_line_comment_strings = {"#=", "=#"},
})


kmt.configure_language("gnuplot", {
    single_line_comment_string = "#",
})

vim.g.kommentary_create_default_mappings = false

vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("x", "<leader>/", "<Plug>kommentary_visual_default", {})
