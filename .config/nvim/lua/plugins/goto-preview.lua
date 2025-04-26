return {
	"rmagatti/goto-preview",
	event = "BufEnter",
	config = function()
		local preview = require("goto-preview")

		preview.setup()

		local map = require("utils").map

		map("gpd", function()
			preview.goto_preview_definition()
		end, { desc = "LSP: Goto Definition" })
		map("gpt", function()
			preview.goto_preview_type_definition()
		end, { desc = "LSP: Goto Type Definition" })
		map("gpi", function()
			preview.goto_preview_implementation()
		end, { desc = "LSP: Goto Implementation" })
		map("gpD", function()
			preview.goto_preview_declaration()
		end, { desc = "LSP: Goto Declaration" })
		map("gP", function()
			preview.close_all_win()
		end, { desc = "Preview: Close All" })
		map("gpr", function()
			preview.goto_preview_references()
		end, { desc = "LSP: Goto References" })
	end,
}
