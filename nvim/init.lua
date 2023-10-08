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
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.swapfile = false
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
  "nvim-tree/nvim-tree.lua"
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
require('nvim_comment').setup()
require('nvim-tree').setup()
