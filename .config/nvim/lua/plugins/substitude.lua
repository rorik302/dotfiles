return {
	"gbprod/substitute.nvim",
	config = function()
		local substitute = require("substitute")

		substitute.setup({})

		local map = require("utils").map
		map("s", function()
			substitute.operator()
		end, { desc = "Substitute" })
		map("ss", function()
			substitute.line()
		end, { desc = "Substitute: Line" })
		map("S", function()
			substitute.eol()
		end, { desc = "Substitute: EOL" })
		map("s", function()
			substitute.visual()
		end, { desc = "Substitute: Visual" }, "v")
	end,
}
