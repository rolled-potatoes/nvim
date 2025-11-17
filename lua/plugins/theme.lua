return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local theme = require("tokyonight")
		theme.setup({
			style = "moon",
		})
	end,
}
