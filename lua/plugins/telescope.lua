-- fuzzy finder: 파일 탐색기
-- https://github.com/nvim-telescope/telescope.nvim
return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					".git",
					".DS_Store",
					"%.cache/",
				},
			},
			pickers = {
				find_files = {},
			},
		})

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end, { desc = "Telescope find files", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fl", builtin.diagnostics, { desc = "Telescope buffers" })
	end,
}
