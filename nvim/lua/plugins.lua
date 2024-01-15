return {
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"bash-lsp/bash-language-server",
	"lewis6991/gitsigns.nvim",
	"terrortylor/nvim-comment",
	"nvim-tree/nvim-tree.lua",
	{
		"ray-x/go.nvim",
		dependencies = {  -- optional packages
			"ray-x/guihua.lua",
	    	"neovim/nvim-lspconfig",
	    	"nvim-treesitter/nvim-treesitter",
		},
		config = function()
	    	require("go").setup()
		end,
		event = {"CmdlineEnter"},
		ft = {"go", 'gomod'},
		build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	}
}
