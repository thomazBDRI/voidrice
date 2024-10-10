local lsp = require("lsp-zero")

require("lsp-format").setup({})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	client.server_capabilities.semanticTokensProvider = nil

	if client.supports_method("textDocument/formatting") then
		require("lsp-format").on_attach(client)
	end

	-- vim.keymap.set("n", "ld", function() vim.lsp.buf.definition() end, opts) Moved to Telescope
	-- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts) Moved to Lspsaga
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	-- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts) Moved to Telescope
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	-- vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
	vim.keymap.set("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	vim.keymap.set("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts)
	vim.keymap.set("n", "<leader>lh", "<cmd>Lspsaga hover_doc<cr>", opts)
	vim.keymap.set("n", "<leader>li", '<cmd>LspInfo<cr>", "Info', opts)
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format()
	end, opts)

	vim.keymap.set("n", "<leader>lj", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts)
	vim.keymap.set("n", "<leader>lk", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts)
	-- vim.keymap.set("n", "<leader>ln",
	-- "<CMD>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)
	-- vim.keymap.set("n", "<leader>le",
	-- "<CMD>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>", opts)

	vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", opts)
	vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
	vim.keymap.set("n", "<leader>ls", "<cmd>Lspsaga finder<cr>", opts)
	vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)

	-- vim.keymap.set("n", "<leader>le", function() vim.lsp.buf.references() end, opts) Moved to Telescope
	-- vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts) -- Moved to lspsaga
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.set_sign_icons({
	error = "🛑",
	warn = "⚠️",
	hint = "🔍",
	info = "👉",
})

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

require("lspconfig").lua_ls.setup({
	on_init = function(client)
		lsp.nvim_lua_settings(client, {})
	end,
})

require("lspconfig").dartls.setup({
	cmd = { "dart", "language-server", "--protocol=lsp" },
})

require("lspconfig").tailwindcss.setup({
	filetypes = { "templ", "astro", "javascript", "typescript", "react", "go" },
	settings = {
		tailwindCSS = {
			includeLanguages = {
				templ = "html",
			},
			experimental = {
				classRegex = {
					"Class\\(([^)]*)\\)",
					'["`]([^"`]*)["`]',
					"Classes\\(([^)]*)\\)",
					'["`]([^"`]*)["`]',
					"Class\\{([^)]*)\\}",
					'["`]([^"`]*)["`]',
					"Classes\\{([^)]*)\\}",
					'["`]([^"`]*)["`]',
					'Class:\\s*["`]([^"`]*)["`]',
					'Classes:\\s*["`]([^"`]*)["`]',
				},
			},
		},
	},
})

lsp.setup()

require("flutter-tools").setup({})

-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   float = {
--     border = "rounded",
--     source = "always",
--   },
-- })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

require("lspsaga").setup({
	lightbulb = {
		enable = false,
	},
})
