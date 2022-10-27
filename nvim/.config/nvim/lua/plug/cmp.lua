local cmp = require'cmp'

-- Highlight
vim.api.nvim_command('hi CmpItemKind ctermfg=White')
vim.api.nvim_command('hi CmpItemMenu ctermfg=White')

vim.opt.completeopt = "menuone,noselect"


-- nvim-cmp setup
cmp.setup {
   -- snippet = {
   --    expand = function(args)
   --       require("luasnip").lsp_expand(args.body)
   --    end,
   -- },
    window = {
        completion = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
            -- border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'},
        },
    },
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
            require("plug/lspkind_icons").icons[vim_item.kind],
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
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
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
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
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
        -- { name = "latex_symbols" },
    },
}
