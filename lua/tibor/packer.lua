-- Only required if you have packer configured as `opt`packer
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	
  use {
	  'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} },
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- use {
  --     'VonHeikemen/lsp-zero.nvim',
  --     branch = 'v2.x',
  --     requires = {
  --         -- LSP Support
  --         {'neovim/nvim-lspconfig'},             -- Required
  --         {'williamboman/mason.nvim'},           -- Optional
  --         {'williamboman/mason-lspconfig.nvim'}, -- Optional
  --
  --         -- Autocompletion
  --         {'hrsh7th/nvim-cmp'},     -- Required
  --         {'hrsh7th/cmp-nvim-lsp'}, -- Required
  --         {'L3MON4D3/LuaSnip'},     -- Required
  --     }
  -- }
  --

  -- use {'edluffy/hologram.nvim'}

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }


  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  -- Might be slowing stuff down?
  -- use({
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup {
  --       enabled = false,
  --       -- your config goes here
  --       -- or just leave it empty :)
  --     }
  --   end,
  -- })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

end)
