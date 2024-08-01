-- change appearance of file explorer to use the tree style
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- show relative numbers 
opt.relativenumber = true
-- show current line number for cursor
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- enable or disable line wrapping
-- opt.wrap = false

-- search settings
opt.ignorecase = true
-- if mixed case in search assumes case-sensitive search
opt.smartcase = true
-- highlight current cursor line
opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- let backspace operate as you would expect
opt.backspace = "indent,eol,start"

-- use system clipboard as default
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- turn off swapfile
opt.swapfile = false
