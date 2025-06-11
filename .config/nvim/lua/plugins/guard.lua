return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua")
		ft("python"):fmt("ruff"):append("black"):lint("ruff")
		ft("typescript,javascript,typescriptreact,vue,jsx,html,json,yaml"):fmt("prettier")
		ft("typescript,javascript"):lint("eslint_d")
		ft("docker"):lint("hadolint")
		ft("css,scss"):fmt("prettier"):lint("stylelint")
	end,
}
