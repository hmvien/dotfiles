-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<esc>")

-- switch tab with gt
vim.keymap.set("n", "gt", "<cmd>bnext<cr>")

-- remove the <esc>-[jk] line swap
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")

-- We set up wezterm to remap shift-enter to 0xAB since it didn't send the key to the terminal correctly
-- add white space above and below the cursor
vim.keymap.set("n", "<Char-0xAB>", "O<Esc>j")
vim.keymap.set("n", "<CR>", "o<Esc>k")

-- map cmd-c to copy. See wezterm config
vim.keymap.set("n", "<Char-0xAA>", '"+y')
vim.keymap.set("v", "<Char-0xAA>", '"+y')
vim.keymap.set("i", "<Char-0xAA>", '"+y')

-- center the screen after moving with n/N
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "n", "nzz")

-- handle line wrap better with j and k
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
