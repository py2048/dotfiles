pcall(require, "impatient")
local function vimsrc(f) vim.cmd("source $HOME/.config/nvim/vim/" .. f .. ".vim") end

require "plugins"
require "options"
require "color"
vimsrc "utils"
vimsrc "mappings"
require "plug/config"
vimsrc "vplug/config"
