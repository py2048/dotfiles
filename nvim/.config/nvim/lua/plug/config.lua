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
