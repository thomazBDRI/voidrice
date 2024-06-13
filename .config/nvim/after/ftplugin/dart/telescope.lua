local telescope = require('telescope')

vim.keymap.set('n', '<leader>ta', telescope.extensions.flutter.commands, {})
