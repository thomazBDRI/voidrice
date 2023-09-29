-- update shortcuts on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {"bm-files,bm-dirs"},
  command = "!shortcuts"
})
