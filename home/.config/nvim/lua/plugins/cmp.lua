return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "saadparwaiz1/cmp_luasnip" },
	},

	config = function()
		local cmp = require("cmp")
		local types = require("cmp.types")
		local luasnip = require("luasnip")

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "neorg" },
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-j>"] = {
					i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
				},
				["<C-k>"] = {
					i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
				},
				["<Tab>"] = {
					i = function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end,
				},
				["<S-Tab>"] = {
					i = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
						else
							fallback()
						end
					end,
				},
			}),
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})
	end,
}
