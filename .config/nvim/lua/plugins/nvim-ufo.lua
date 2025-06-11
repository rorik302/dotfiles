local statuscol = {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { "%s" }, click = "v:lua.ScSa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
	end,
}

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local totalLines = vim.api.nvim_buf_line_count(0)
	local foldedLines = endLnum - lnum
	local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
	suffix = (" "):rep(rAlignAppndx) .. suffix
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		statuscol,
	},
	event = "VeryLazy",
	config = function()
		require("ufo").setup({
			fold_virt_text_handler = handler,
			preview = {
				win_config = {
					border = "rounded",
					winblend = 0,
				},
				mappings = {
					scrollU = "<C-u>",
					scrollD = "<C-d>",
					scrollE = "<Down>",
					scrollY = "<Up>",
					jumpTop = "gg",
					jumpBot = "G",
				},
			},
		})

		vim.keymap.set("n", "zR", function()
			require("ufo").openAllFolds()
		end, { desc = "Ufo: Open All Folds" })
		vim.keymap.set("n", "zM", function()
			require("ufo").closeAllFolds()
		end, { desc = "Ufo: Close All Folds" })
		vim.keymap.set("n", "zr", function()
			require("ufo").openFoldsExceptKinds()
		end, { desc = "Ufo: Fold Less" })
		vim.keymap.set("n", "zm", function()
			require("ufo").closeFoldsWith()
		end, { desc = "Ufo: Fold More" })
		vim.keymap.set("n", "zK", function()
			require("ufo").peekFoldedLinesUnderCursor()
		end)
		vim.keymap.set("n", "K", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Ufo: Peek fold" })
	end,
}
