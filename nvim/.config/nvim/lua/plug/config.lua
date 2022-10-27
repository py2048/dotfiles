require "plug/lualine"
require "plug/comment"
require "plug/treesitter"
require "plug/nscroll"
require "plug/cmp"
require "plug/auto-pairs"
require "plug/lsp-cfg"
require "plug/colorizer"
require "plug/floatterm"
require "plug/latex-symbols"

-- Config

-- Surround
require("nvim-surround").setup()

-- indent
vim.opt.list = true
require("indent_blankline").setup()

-- ftFT
require('eyeliner').setup {
    highlight_on_key = true,
}
vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#d4bfff', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ffcc66', bold = true, underline = true })
