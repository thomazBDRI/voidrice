local builtin = require("telescope.builtin")
local telescope = require("telescope")
local fb_actions = require "telescope._extensions.file_browser.actions"

telescope.setup({
  defaults = {
    initial_mode = "normal",
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      path = vim.fn.expand('%:p:h'),
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["n"] = {
          ["<leader>tb"] = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local bloc = require("bloc")

            local current_picker = action_state.get_current_picker(prompt_bufnr)
            local finder = current_picker.finder

            local base_dir = action_state.get_selected_entry().cwd

            vim.ui.input("Bloc: ", function(name)
              bloc.create_bloc(name, base_dir .. "/")
              current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
            end)
          end,
          ["<leader>tc"] = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local bloc = require("bloc")

            local current_picker = action_state.get_current_picker(prompt_bufnr)
            local finder = current_picker.finder

            local base_dir = action_state.get_selected_entry().cwd

            vim.ui.input("Cubit: ", function(name)
              bloc.create_cubit(name, base_dir .. "/")
              current_picker:refresh(finder, { reset_prompt = true, multi = current_picker._multi })
            end)
          end,
        },
      },
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("flutter")

vim.keymap.set("n", "<leader>ld", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>lw", builtin.lsp_workspace_symbols, {})
vim.keymap.set("n", "<leader>le", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fi", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fk", function()
  builtin.grep_string()
end)

vim.keymap.set("n", "<space>pv", ":Telescope file_browser<CR>")

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>pb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
