local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    -- debug = true,
    sources = {
        --fortran
        formatting.fprettify.with({extra_args = {"-i", "4"}}),
        -- c
        formatting.clang_format,
        -- python
        formatting.yapf,
        diagnostics.flake8,
    }
})
