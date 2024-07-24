local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Example using a list of specs with the default options
-- vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- modules
require('settings')
require('lazy').setup('plugins')

-- setups
require('gitsigns').setup()
require('nvim-tree').setup()
require('nvim-web-devicons').setup()
require('nvim-dap-virtual-text').setup()
require('yaml-companion').open_ui_select()
-- require('yaml-companion').setup()

-- lsp
require('lsp')
