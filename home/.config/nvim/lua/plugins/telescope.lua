return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("fzf")

			local telescope_actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = telescope_actions.move_selection_next,
							["<C-k>"] = telescope_actions.move_selection_previous,
						},
					},
					file_ignore_patterns = {
						"^target/",
						"^node_modules/",
					},
				},
				pickers = {
					find_files = {
						follow = true,
					},
					live_grep = {
						additional_args = { "-L" },
					},
				},
			})

			local telescope_builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, nil)
			vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, nil)
			vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, nil)
			vim.keymap.set("n", "<leader>fr", telescope_builtin.lsp_references, nil)
		end,
	},
}
