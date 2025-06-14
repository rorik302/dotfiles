vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("", "<Space>", "<Nop>")

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true, desc = "Nvim: Clear search highlight" })

vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Nvim: Open Diagnostic Quickfix List" })

vim.keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "Nvim: Save and quit", silent = true })
vim.keymap.set("n", "<leader>qq", ":q!<CR>", { desc = "Nvim: Quit (Nvim/Window)", silent = true })
vim.keymap.set("n", "<leader>qQ", ":qa!<CR>", { desc = "Nvim: Quit Without Save", silent = true })
vim.keymap.set("n", "<leader>ww", ":w<CR>", { desc = "Nvim: Save", silent = true })

vim.keymap.set("n", "gF", ":! open <cfile>", { desc = "Open file/url under cursor" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Windows: Move focus to the left window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Windows: Move focus to the down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Windows: Move focus to the up window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Windows: Move focus to the right window" })

vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Cursor: Move to the beginning of the line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Cursor: Move to the end of the line" })
vim.keymap.set("n", "j", "gj", { desc = "Cursor: Move to the next line" })
vim.keymap.set("n", "k", "gk", { desc = "Cursor: Move to the previous line" })
vim.keymap.set("n", "n", "nzz", { desc = "Cursor: Move to the next search result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Cursor: Move to the previous search result" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Cursor: Scroll down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Cursor: Scroll up half a page" })

vim.keymap.set({ "n", "v" }, "dd", '"_dd', { desc = "Delete: Line" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete: Text" })

vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move: Text Up" })
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move: Text Down" })
vim.keymap.set("v", ">", ">gv", { desc = "Move: Text Right" })
vim.keymap.set("v", "<", "<gv", { desc = "Move: Text Left" })
