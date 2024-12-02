-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<esc>")

-- remove the <esc>-[jk] line swap
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")

-- map cmd-c to copy. See wezterm config
vim.keymap.set("n", "<Char-0xAA>", '"+y')
vim.keymap.set("v", "<Char-0xAA>", '"+y')
vim.keymap.set("i", "<Char-0xAA>", '"+y')
