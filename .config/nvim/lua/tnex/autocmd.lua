-- Auto format on file save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format()
  end
})

-- update shortcuts on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"bm-files,bm-dirs"},
  command = "!shortcuts"
})
