vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("first_run")
require("lazy").setup("plugins", { checker = { enabled = true, notify = false } })
require("options")
require("mappings")
