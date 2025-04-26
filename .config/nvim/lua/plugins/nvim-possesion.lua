return {
	"gennaro-tedesco/nvim-possession",
	config = function()
		local ps = require("nvim-possession")

		ps.setup()

		local map = require("utils").map
		map("<leader>sl", function()
			ps.list()
		end, { desc = "Session: List" })
		map("<leader>sn", function()
			ps.new()
		end, { desc = "Session: New" })
		map("<leader>su", function()
			ps.update()
		end, { desc = "Session: Update" })
		map("<leader>sd", function()
			ps.delete()
		end, { desc = "Session: Delete" })
	end,
}
