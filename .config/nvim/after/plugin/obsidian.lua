require("obsidian").setup({
	workspaces = {
		{
			name = "main",
			path = "~/Obsidian",
		},
	},
})

vim.keymap.set("n", "<leader>oq", ":ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>")
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>")
vim.keymap.set("n", "<leader>oe", ":ObsidianExtractNote<CR>")
vim.keymap.set("n", "<leader>oi", ":ObsidianPasteImg<CR>")
