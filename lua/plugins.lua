local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'folke/tokyonight.nvim'
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- suggestion 을 vscode 처럼 보이도록
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source fopr neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'neovim/nvim-lspconfig'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- highlight
  use 'windwp/nvim-autopairs'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'kyazdani42/nvim-web-devicons' -- icon
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*'
  }
  use 'norcalli/nvim-colorizer.lua'
  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      {"nvim-treesitter/nvim-treesitter"}
    }
  })
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })
  use { 'saadparwaiz1/cmp_luasnip' }
  use({
     "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
        "nvim-lua/plenary.nvim",
    },
  })
  use ( {
    "akinsho/toggleterm.nvim",
    tag = '*'
  } )
  use {
    'numToStr/Comment.nvim',
  }
  use{
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  use 'windwp/nvim-ts-autotag'
end)
