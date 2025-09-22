-- Key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- File explorer shortcuts
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer" })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Always center after jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz")
