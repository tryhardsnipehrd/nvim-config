local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.maplocalleader = ","
require("lazy").setup({
	{"nvim-treesitter/nvim-treesitter", build="TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
	},
	"tanvirtin/monokai.nvim",
	"folke/todo-comments.nvim",
	{"nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
    "neovim/nvim-lspconfig",
})
