vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = require("utils").map

-- Сброс стандартного поведения Space
map("<Space>", "<Nop>", {}, { "n", "v" })

-- Операции и работа с буфером
map("x", '"_x', { desc = "Delete without yank" }, { "n", "v" })
-- map("d", '"_d', { desc = "Delete without yank" }, { "n", "v" })
map("<leader>d", [["_d]], { desc = "Delete without yank" }, { "n", "v" })
map("<leader>p", [["_dP]], { desc = "Paste without yank" }, "x")
map("p", '"_dP', { desc = "Paste without yank" }, "v")

-- Коммандная строка
function OpenCommandLine()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":", true, false, true), "n", false)
end
map("<leader><Space>", OpenCommandLine)

-- Очистка результатов поиска
map("<Esc>", ":nohlsearch<CR>", { desc = "Clean Search Highlight" })

-- Сохранение и выход
map("<leader>w", ":w<CR>", { desc = "Save" })
map("<leader>q", ":q<CR>", { desc = "Quit" })
map("<leader>Q", ":qa!<CR>", { desc = "Quit!" })

-- Сдвиг текста
map("K", ":move '<-2<CR>gv=gv", { desc = "Move Text Up" }, "v")
map("J", ":move '>+1<CR>gv=gv", { desc = "Move Text Down" }, "v")
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

-- Центрирование
map("<C-d>", "<C-d>zz", { desc = "Scroll: Half Page Down" })
map("<C-u>", "<C-u>zz", { desc = "Scroll: Half Page Up" })
map("n", "nzzzv", { desc = "Search: Next" })
map("N", "Nzzzv", { desc = "Search: Previous" })

-- UI
map("<leader>uw", ":set wrap!<CR>", { desc = "Toggle Wrap" })
