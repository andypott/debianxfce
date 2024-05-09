return {
	"williamboman/mason.nvim",

	build = ":MasonUpdate",

	config = function()
		require("mason").setup({})

		local formatters = {
			"clang-format",
			"goimports",
			"prettier",
			"stylua",
		}

		local mason_registry = require("mason-registry")

		for _, package in ipairs(formatters) do
			if not mason_registry.is_installed(package) then
				mason_registry.get_package(package):install()
			end
		end
	end,
}
