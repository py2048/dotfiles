-- local present1, nvim_lsp = pcall(require, "lspconfig")

-- if not present1 then
--    return
-- end

local nvim_lsp = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require'lspconfig'.ccls.setup {
  capabilities = capabilities,
  autostart = false
}

require'lspconfig'.pyright.setup {
  capabilities = capabilities,
  autostart = false
}

-- require'lspconfig'.bashls.setup {
--   capabilities = capabilities,
-- }


local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"

    -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
    local sumneko_root_path = os.getenv("HOME")..'/Apps/lua-language-server'
    local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

    -- local runtime_path = vim.split(package.path, ';')
    -- table.insert(runtime_path, "lua/?.lua")
    -- table.insert(runtime_path, "lua/?/init.lua")

    require'lspconfig'.sumneko_lua.setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua", "--logpath="..os.getenv("HOME").."/.cache/nvim/sumneko_lsp.log"};
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          workspace = {
              ignoreDir = {".vscode", ".git", "nvim", "autoload", "mpv", ".config", "Apps"}
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
        capabilities = capabilities,
        autostart = false
      },
    }

end
