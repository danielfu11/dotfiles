-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10        -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true      -- Case sensitive if uppercase in search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Visual
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.laststatus = 3       -- This is how I get 1 status line for all splits

-- File
vim.opt.autoread = true      -- auto reload files changed outside nvim

