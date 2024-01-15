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
vim.opt.rtp:prepend(lazypath)

-- modules
require('settings')
require('lsp')
require('lazy').setup('plugins')

-- setups
require('gitsigns').setup()
require('nvim_comment').setup()
require('nvim-tree').setup()
require('nvim-treesitter').setup()
require('lspconfig').gopls.setup({
	on_attach = on_attach
})
