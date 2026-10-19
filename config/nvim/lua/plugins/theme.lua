return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		--color styles: night, storm, moon and day
	-- 		vim.cmd.colorscheme("tokyonight-night")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("catppuccin-mocha")
	-- 	end,
	-- },

	{ "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup()
      vim.cmd.colorscheme("dracula")
    end,
},
	-- {
	-- 	"loctvl842/monokai-pro.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	-- config = function()
	-- 	-- require("monokai-pro").setup()
	-- 	-- vim.cmd.colorscheme("monokai-pro-spectrum")
	-- 	-- end,
	-- },
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
}
