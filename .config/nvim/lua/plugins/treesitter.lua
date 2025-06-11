local parsers = {
	"bash",
	"c",
	"cmake",
	"comment",
	"css",
	"csv",
	"diff",
	"dockerfile",
	"fish",
	"html",
	"http",
	"hyprlang",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"regex",
	"scss",
	"sql",
	"tmux",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"vue",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install(parsers)

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				local buf = vim.api.nvim_get_current_buf()

				local parser = vim.treesitter.get_parser(buf, nil, { error = false })
				if parser == nil then
					return
				end

				vim.treesitter.start(buf)

				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
