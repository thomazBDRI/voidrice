-- update shortcuts on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "bm-files,bm-dirs" },
  command = "!shortcuts"
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "xresources" },
  command = "!xrdb merge ~/.config/x11/xresources && killall -USR1 st"
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "**/*dwm*/**/*.h" },
  command = "!sudo make install"
})
