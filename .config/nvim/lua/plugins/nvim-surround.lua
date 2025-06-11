local function surround_word()
	local input = vim.fn.input("Surround: Word with ")
	vim.cmd(":norm ysiw" .. input)
	print("Surround: Word surrounded")
end

local function surround_line()
	local input = vim.fn.input("Surround: Line with ")
	vim.cmd(":norm ^ys$" .. input)
	print("Surround: Line surrounded")
end

local function surround_delete()
	local input = vim.fn.input("Delete: ")

	if string.find(input, "tag") or string.find(input, "t") then
		local ok, _ = pcall(vim.cmd(":norm dst"))
		if ok then
			print("Surround: Deleted Tag")
		end
		print("Surround: No tag found")
		return
	end

	local to_delete = string.sub(input, 1, 1)
	vim.cmd(":norm ds" .. to_delete)
	print("Surround: Deleted " .. to_delete)
end

local function surround_change()
	local input = vim.fn.input("Change(from, to): ")

	local new_char = string.sub(input, 2, -1)

	-- Change tag
	if input:find("^t") ~= nil then
		local ok, _ = pcall(vim.cmd(":norm cst<" .. new_char .. ">"))
		if ok then
			print("Surround: Changed Tag")
		else
			print("Surround: No tag found")
		end
		return
	end

	local old_char = string.sub(input, 1, 1)

	vim.cmd(":norm cs" .. old_char .. new_char)
	print("Surround: Changed " .. old_char .. " to " .. new_char)
end

vim.keymap.set("n", "<leader>sw", surround_word, { desc = "Surround: Word" })
vim.keymap.set("n", "<leader>sl", surround_line, { desc = "Surround: Line" })
vim.keymap.set("n", "<leader>sd", surround_delete, { desc = "Surround: Delete" })
vim.keymap.set("n", "<leader>sc", surround_change, { desc = "Surround: Change" })

return {
	"kylechui/nvim-surround",
	version = "^3.0.0",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			move_cursor = "sticky",
		})
	end,
}
