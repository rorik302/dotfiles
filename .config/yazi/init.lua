---@diagnostic disable: undefined-global
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- Git
th.git = th.git or {}
th.git.modified_sign = ""
th.git.deleted_sign = ""
th.git.added_sign = ""
th.git.untracked_sign = ""
th.git.ignored_sign = ""
th.git.updated_sign = "!"
require("git"):setup()

require("projects"):setup({
	save = {
		method = "lua", -- yazi | lua
		-- lua_save_path = "", -- comment out to get the default value
		-- windows: "%APPDATA%/yazi/state/projects.json"
		-- unix: "~/.local/state/yazi/projects.json"
	},
	last = {
		update_after_save = true,
		update_after_load = true,
		load_after_start = true,
	},
	merge = {
		quit_after_merge = false,
	},
	notify = {
		enable = true,
		title = "Projects",
		timeout = 3,
		level = "info",
	},
})
