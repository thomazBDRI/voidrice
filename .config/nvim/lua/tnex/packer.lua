-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require("rose-pine").setup()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use('navarasu/onedark.nvim')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  use {
    'nvim-treesitter/nvim-treesitter-context',
    after = "nvim-treesitter",
  }

  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-unimpaired')
  use('tpope/vim-surround')
  -- use('tpope/vim-commentary') Using nvim comment as a test
  use('tpope/vim-repeat')
  use('airblade/vim-gitgutter')
  use('chrisbra/Colorizer')

  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  -- tests what is this for?
  use {
    'nvim-lua/popup.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  -- Some test line
  use {
    'windwp/windline.nvim'
  }

  use {
    'yamatsum/nvim-cursorline'
  }

  -- I looked for it for sow long
  use {
    'windwp/nvim-ts-autotag'
  }

  -- Don't know if i like it still
  -- use {
  --   'lukas-reineke/indent-blankline.nvim'
  -- }

  -- This one will mess things up
  use {
    'nvimdev/lspsaga.nvim'
  }

  use {
    "tversteeg/registers.nvim",
  }

  use {
    "windwp/nvim-autopairs"
  }

  use {
    "norcalli/nvim-colorizer.lua"
  }

  -- New UI?
  use {
    "folke/noice.nvim",
    requires = {
      { "rcarriga/nvim-notify" },
      { "MunifTanjim/nui.nvim" }
    }
  }

  use { "cbochs/portal.nvim" }

  -- Terminal stuff test
  use { "akinsho/toggleterm.nvim" }
  use { "pianocomposer321/consolation.nvim" }

  -- Test comment stuff
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'hrsh7th/cmp-cmdline' },      -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
      { 'tzachar/cmp-tabnine',              run = './install.sh' }
    }
  }

  use {
    'folke/trouble.nvim',
    requires = {
      { 'nvim-tree/nvim-web-devicons' }
    }
  }
end)
