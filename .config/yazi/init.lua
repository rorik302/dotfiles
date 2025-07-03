-- Plugins
require("full-border").setup()

-- Git
th.git = th.git or {}
th.git.modified_sign = ""
th.git.deleted_sign = ""
th.git.added_sign = ""
th.git.untracked_sign = ""
th.git.ignored_sign = ""
th.git.updated_sign = "!"
require("git"):setup()

-- Add symlink to statusbar
Status:children_add(function(self)
	local h = self._current.hovered
	
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- Show user/group in statusbar
Status:children_add(function()
	local h = cx.active.current.hovered

	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)
