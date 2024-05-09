return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},

				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = {
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
						},
					},
					lualine_z = { { "datetime", style = "%d/%m/%y %H:%M" } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},

				winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},

				inactive_winbar = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}
