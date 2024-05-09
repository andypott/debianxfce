return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },

	config = function()
		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local default_setup = function(server)
			lspconfig[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"eslint",
				"gopls",
				"html",
				"jsonls",
				"lua_ls",
				"rust_analyzer",
				"tsserver",
			},
			handlers = {
				default_setup,

				lua_ls = function()
					lspconfig.lua_ls.setup({
						capabilities = lsp_capabilities,
						settings = {
							Lua = {
								runtime = {
									version = "LuaJIT",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,

				clangd = function()
					lspconfig.clangd.setup({ cmd = { "clangd", "-header-insertion=never" } })
				end,
			},
		})
	end,
}
