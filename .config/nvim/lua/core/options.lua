-- Строки
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false

-- Табы и отступы
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- Поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- Буфер обмена
vim.opt.clipboard:append("unnamedplus")

-- Мышь
vim.opt.mouse = ""

-- Подтверждение выхода если файл не сохранен
vim.opt.confirm = true

-- Внешний вид
vim.opt.termguicolors = true

-- Таймауты
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

-- Бэкап и своп
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.undodir")

vim.g.autoformat = true
