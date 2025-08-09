-- Window
vim.o.winborder = 'rounded'
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.laststatus = 3
vim.o.showcmd = false

-- Number column
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'

-- Cursor
vim.o.scrolloff = 99
vim.o.cursorline = true

-- Tabs
local tabSize = 4

vim.o.tabstop = tabSize
vim.o.softtabstop = tabSize
vim.o.shiftwidth = tabSize

vim.o.expandtab = false

-- Indenting
vim.o.autoindent = true
vim.o.smartindent = true
vim.g.autoformat = false

-- Whitespace Hints
vim.o.list = true
vim.o.listchars = 'tab:┃ ,trail:*,multispace:*,leadmultispace:┃...,nbsp:+'
vim.o.showbreak = '--> '

-- Wrapping
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.wrap = false

-- Searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- View Splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- UX
vim.o.confirm = true
