return {
	"neovim/nvim-lspconfig",

	config = function()
		vim.keymap.set("n", "gl", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "x" }, "<F3>", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>=", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
	end,
}
