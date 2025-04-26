return {
	"nvimdev/guard.nvim",
  event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua")
	end,
}
