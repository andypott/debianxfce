return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					c = {
						require("formatter.filetypes.c").clangformat,
					},
					css = {
						require("formatter.filetypes.css").prettier,
					},
					go = {
						require("formatter.filetypes.go").goimports,
					},
					html = {
						require("formatter.filetypes.html").prettier,
					},
					javascript = {
						require("formatter.filetypes.javascript").prettier,
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettier,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier,
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettier,
					},
					rust = {
						require("formatter.filetypes.rust").rustfmt,
					},
				},
			})

			local formatOnWriteGroup = vim.api.nvim_create_augroup("formatOnWrite", { clear = true })
			vim.api.nvim_create_autocmd("BufWritePost", { command = "FormatWrite", group = formatOnWriteGroup })
		end,
	},
}
