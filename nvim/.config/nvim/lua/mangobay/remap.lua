-- Key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- File Explorer

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Always center after jumping
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffers
vim.keymap.set("n", "<leader>sh", vim.cmd.split)
vim.keymap.set("n", "<leader>sv", vim.cmd.vsplit)
-- NOTE TO SELF: always read the docs before remapping shit
-- vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)
-- vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- paste keeps buffer on replace
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete to void
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
