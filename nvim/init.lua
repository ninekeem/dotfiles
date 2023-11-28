local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.expandtab = false
vim.opt.number = true
vim.opt.rtp:prepend(lazypath)
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.g.python3_host_prog = "/usr/bin/python3"
vim.opt.clipboard = "unnamedplus"

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"davidhalter/jedi-vim",
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
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

require('gitsigns').setup()
require('go').setup()
require('nvim_comment').setup()
require('nvim-tree').setup()
require('nvim-treesitter').setup()

require('lspconfig').gopls.setup({})
