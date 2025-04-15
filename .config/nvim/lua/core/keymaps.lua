vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Очистка результатов поиска
map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- Сдвиг текста с сохранением выделения
map("v", ">", ">gv", opts)
map("v", "<", "<gv", opts)

-- Переключение окон
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Изменение размеров окон
map("n", "<A-h>", "<C-w><", opts)
map("n", "<A-j>", "<C-w>-", opts)
map("n", "<A-k>", "<C-w>+", opts)
map("n", "<A-l>", "<C-w>>", opts)

