vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'go',
--   callback = function()
--     vim.lsp.start({
--       name = 'gopls',
--       cmd = { 'gopls' },
--     })
--   end,
-- })
