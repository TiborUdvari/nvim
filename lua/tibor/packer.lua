-- Only required if you have packer configured as `opt`
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
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        enabled = false,
        -- your config goes here
        -- or just leave it empty :)
      }
    end,
  })

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

end)
