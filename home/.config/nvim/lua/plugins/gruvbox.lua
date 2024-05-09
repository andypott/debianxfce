return {
	"sainnhe/gruvbox-material",

	config = function()
		vim.opt.termguicolors = true
		vim.opt.background = "dark"
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "original"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
