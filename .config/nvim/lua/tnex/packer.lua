-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim",  run = "make" },
    },
  })

  use("navarasu/onedark.nvim")
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  })

  use({
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
  })

  use("chentoast/marks.nvim")

  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("tpope/vim-unimpaired")
  use("tpope/vim-surround")
  use("tpope/vim-commentary") -- Using nvim comment as a test
  use("tpope/vim-repeat")
  use("airblade/vim-gitgutter")

  -- 	use({ "RobertPietraru/bloc.nvim", requires = {
  -- 		{ "nvimtools/none-ls.nvim" },
  -- 	} })

  use({
    "epwalsh/obsidian.nvim",
    tag = "v3.9.0",
  })

  use({
    "akinsho/flutter-tools.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "stevearc/dressing.nvim" },
      {
        "RobertPietraru/bloc.nvim",
        requires = {
          { "nvimtools/none-ls.nvim" },
        },
      },
    },
  })

  -- tests what is this for?
  -- use {
  -- 'nvim-lua/popup.nvim',
  -- requires = {
  -- 'nvim-lua/plenary.nvim',
  --}
  --}

  use({
    "yamatsum/nvim-cursorline",
  })
  --
  -- -- I looked for it for sow long
  use({
    "windwp/nvim-ts-autotag",
  })

  -- This one will mess things up
  use({
    "nvimdev/lspsaga.nvim",
  })

  use({
    "windwp/nvim-autopairs",
  })

  use({
    "norcalli/nvim-colorizer.lua",
  })

  use({
    "folke/todo-comments.nvim",
  })

  -- New UI?
  use({
    "folke/noice.nvim",
    requires = {
      { "rcarriga/nvim-notify" },
      { "MunifTanjim/nui.nvim" },
    },
  })

  -- Terminal stuff test
  -- use { "akinsho/toggleterm.nvim" }
  -- use { "pianocomposer321/consolation.nvim" }

  use({ "JoosepAlviste/nvim-ts-context-commentstring" })

  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },         -- Required
      { "hrsh7th/cmp-nvim-lsp" },     -- Required
      { "hrsh7th/cmp-buffer" },       -- Optional
      { "hrsh7th/cmp-path" },         -- Optional
      { "hrsh7th/cmp-cmdline" },      -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" },     -- Optional

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        requires = {
          { "rafamadriz/friendly-snippets" },
          { "Nash0x7E2/awesome-flutter-snippets" },
        },
      }, -- Required
      { "tzachar/cmp-tabnine",          run = "./dl_binaries.sh" },

      -- misc
      { "lukas-reineke/lsp-format.nvim" },
    },
  })

  use({
    "folke/trouble.nvim",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    },
  })

  use({ "mrjones2014/op.nvim", run = "make install" })
end)
