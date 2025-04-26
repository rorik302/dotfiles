vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = require("utils").map

-- Коммандная строка
map("<leader><leader>", ":", { desc = "Command Line" })

-- Очистка результатов поиска
map("<Esc>", ":nohlsearch<CR>", { desc = "Clean Search Highlight" })

-- Сохранение и выход
map("<leader>w", ":w<CR>", { desc = "Save" })
map("<leader>q", ":q<CR>", { desc = "Quit" })
map("<leader>Q", ":qa!<CR>", { desc = "Quit!" })

-- Сдвиг текста с сохранением выделения
map(">", ">gv", { desc = "Move Text Right" }, "v")
map("<", "<gv", { desc = "Move Text Left" }, "v")

-- Переключение окон
map("<C-h>", "<C-w>h", { desc = "Window: Focus Left" })
map("<C-j>", "<C-w>j", { desc = "Window: Focus Down" })
map("<C-k>", "<C-w>k", { desc = "Window: Focus Up" })
map("<C-l>", "<C-w>l", { desc = "Window: Focus Right" })

-- Изменение размеров окон
map("<A-h>", "<C-w><", { desc = "Window: Resize Left" })
map("<A-j>", "<C-w>-", { desc = "Window: Resize Down" })
map("<A-k>", "<C-w>+", { desc = "Window: Resize Up" })
map("<A-l>", "<C-w>>", { desc = "Window: Resize Right" })
