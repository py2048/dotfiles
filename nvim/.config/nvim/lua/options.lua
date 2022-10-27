local o = vim.opt

o.hidden = true                           -- Required to keep multiple buffers open multiple buffers
o.wrap = false                            -- Display long lines as just one line
o.encoding = "utf-8"                      -- The encoding displayed
o.pumheight = 10                          -- Makes popup menu smaller
o.fileencoding = "utf-8"                  -- The encoding written to file
o.fileformat = "unix"                     -- Set file format to unix
o.ruler = true                	        -- Show the cursor position all the time
o.cmdheight = 2                           -- More space for displaying messages
o.mouse = "a"                             -- Enable your mouse
o.splitbelow = true                       -- Horizontal splits will automatically be below
o.splitright = true                       -- Vertical splits will automatically be to the right
o.conceallevel = 0                        -- So that I can see `` in markdown files
o.tabstop = 4                             -- Insert 2 spaces for a tab
o.shiftwidth = 4                          -- Change the number of space characters inserted for indentation
o.smarttab = true                         -- Makes tabbing smarter will realize you have 2 vs 4
o.expandtab = true                        -- Converts tabs to spaces
o.smartindent = true                      -- Makes indenting smart
o.autoindent = true                       -- Good auto indent
o.laststatus = 2                          -- Always display the status line
o.number = true                           -- Line numbers
o.relativenumber = true
o.cursorline = true                       -- Enable highlighting of the current line
o.background = "dark"                     -- tell vim what the background color looks like
o.showtabline = 2                         -- Always show tabs
o.showmode = false                        -- We don"t need to see things like -- INSERT -- anymore
o.clipboard = "unnamedplus"               -- Copy paste between vim and everything else
o.eol = true
o.iskeyword:append "-"
o.whichwrap:append("<", "[", "]", "h", "l")
