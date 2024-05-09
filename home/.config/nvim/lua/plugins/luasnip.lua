return {
	"L3MON4D3/LuaSnip",

	config = function()
		local luasnip = require("luasnip")
		vim.keymap.set({ "i", "s" }, "<C-f>", function()
			luasnip.jump(1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-b>", function()
			luasnip.jump(-1)
		end, { silent = true })
	end,
}
