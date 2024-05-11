require "plug/lualine"
require "plug/comment"
require "plug/nscroll"
require "plug/treesitter"
--
require "plug/cmp"
require "plug/auto-pairs"
require "plug/latex-symbols"
require "plug/lsp-cfg"
require "plug/guard"
--
require "plug/colorizer"
require "plug/floatterm"

-- Config

-- Surround
require("nvim-surround").setup({
    surrounds = {
        ["}"] = {
            add = { "{ ", " }" },
            find = function()
                return M.get_selection({ motion = "a{" })
            end,
            delete = "^(. ?)().-( ?.)()$",
        },
        ["{"] = {
            add = { "{", "}" },
            find = function()
                return M.get_selection({ motion = "a}" })
            end,
            delete = "^(.)().-(.)()$",
        }
    }
})

-- indent
vim.opt.list = true
require("ibl").setup()

-- ftFT
require('eyeliner').setup {
    highlight_on_key = true
}

vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#d4bfff', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ffcc66', bold = true, underline = true })
--
