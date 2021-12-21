-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore

local colors = {
    bg = '#191E2A',
    bg_dim = '#262a32',
    bg_light = '#22262E',
    bg_dark = '#101521',
    black = '#222222',
    white = '#abb2bf',
    grey = '#868c96',
    red = '#e06c75',
    green = '#98c379',
    blue = '#61afef',
    purple = '#7c7cff',
    blue2 = '#81A1C1'
}

local theme = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue2 },
    b = { fg = colors.white, bg = colors.bg_dim },
    c = { fg = colors.grey, bg = colors.bg },
    x = { fg = colors.grey, bg = colors.bg },
    y = { fg = colors.grey, bg = colors.bg_dim },
    z = { fg = colors.bg, bg = colors.green },
  },

  insert = {
    x = { fg = colors.grey, bg = colors.bg },
    y = { fg = colors.grey, bg = colors.bg_dim },
    z = { fg = colors.bg, bg = colors.blue },
  },
  visual = {
    x = { fg = colors.grey, bg = colors.bg },
    y = { fg = colors.grey, bg = colors.bg_dim },
    z = { fg = colors.bg, bg = colors.purple },
  },
  replace = {
    x = { fg = colors.grey, bg = colors.bg },
    y = { fg = colors.grey, bg = colors.bg_dim },
    z = { fg = colors.bg, bg = colors.purple },
  },
  command = {
    x = { fg = colors.grey, bg = colors.bg },
    y = { fg = colors.grey, bg = colors.bg_dim },
    z = { fg = colors.bg, bg = colors.red },
  },


  inactive = {
    a = { fg = colors.white, bg = colors.bg_dim },
    b = { fg = colors.white, bg = colors.bg },
    c = { fg = colors.black, bg = colors.bg },
  },
}

local function nvicon()
    return ''
end 

local function cwdicon()
    local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    return ' ' .. dirname .. ' '
end

local function fileicon(str)
    return ' ' .. str
end

local function para()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')

    if current_line == 1 then
      return ' Top'
    elseif current_line == total_lines then
      return ' Bot'
    end

    local percent, _ = math.modf((current_line / total_lines) * 100)
    return ' ' .. percent .. '%%'
end

local function vimode(str)
    return '  ' .. str
end

require('lualine').setup {
  options = {
    theme = theme,
    icons_enabled = true,
    component_separators = '',
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
        { nvicon, separator = { right = ' '} },
    },
    lualine_b = {
        { cwdicon,  separator = { right = ' '}, padding = 1 },
    }, 
    lualine_c = {
        { 'filetype', icon_only = true, padding = { left = 1, right = 0 } },
        { 'filename', fmt=fileicon, padding = { left = 0, right = 1 }},
    },
    lualine_x = {
        { 'filetype' },
    },
    lualine_y = {
        { 'progress', fmt=para , padding = { left = 0, right = 1 }, separator = { left = '' } },
    },
    lualine_z = {
      { 'mode', fmt=vimode , padding = { left = 0, right = 1 }, separator = { left = '' }},
    },
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
        { para, right_padding = 2 }
    },
  },
  tabline = {},
  extensions = {},
}
