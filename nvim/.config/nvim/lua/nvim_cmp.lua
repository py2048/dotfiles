-- local present, cmp = pcall(require, "cmp")

-- if not present then
--    return
-- end

local cmp = require'cmp'

-- Highlight
vim.api.nvim_command('hi CmpItemKind ctermfg=White')
vim.api.nvim_command('hi CmpItemMenu ctermfg=White')

vim.opt.completeopt = "menuone,noselect"

-- local check_back_space = function()
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col == 0 or vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') ~= nil
-- end

-- nvim-cmp setup
cmp.setup {
   -- snippet = {
   --    expand = function(args)
   --       require("luasnip").lsp_expand(args.body)
   --    end,
   -- },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
      format = function(entry, vim_item)
         -- load lspkind icons
        vim_item.kind = string.format(
            "%s %s",
            require("lspkind_icons").icons[vim_item.kind],
            vim_item.kind
        )

        vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            buffer = "[BUF]",
            path = "[PATH]",
        })[entry.source.name]

        return vim_item
      end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
        }),
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            -- elseif check_back_space() then
            --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
            -- elseif has_words_before() then
            --     cmp.complete()
            -- elseif vim.fn['vsnip#available']() == 1 then
            --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '', true)
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            -- elseif check_back_space() then
            --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true), 'n', true)
            -- elseif vim.fn['vsnip#available']() == 1 then
            --     vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '', true)
            else
                fallback()
            end
        end,
    },
    sources = {
        { name = "vsnip" },
        { name = "path" },
        { name = "nvim_lsp" },
        -- { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
    },
}


