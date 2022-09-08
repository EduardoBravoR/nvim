local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
	})
	vim.api.nvim_command 'packadd packer.nvim'
	print "Installing packer close and reopen Neovim..."
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Themes
  use 'Shatur/neovim-ayu'
  use 'joshdick/onedark.vim'
  -- Info decorations
  use {
    'lewis6991/gitsigns.nvim',
  }
  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Icons for other plugins
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Comments
  use 'terrortylor/nvim-comment'
  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'
  -- RGB, HEX colors
  use 'norcalli/nvim-colorizer.lua'
  -- Autocomplete parenthesis and brackets
  use 'windwp/nvim-autopairs'
  -- Syntax highlighting and colors
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- Autotag for html. Its config is on treesitter
  use { 'windwp/nvim-ts-autotag' }
  -- Rainbow for colorized brackets. Its config in on treesitter
  use { 'p00f/nvim-ts-rainbow' }
  -- List the keybindings
  use 'folke/which-key.nvim'
  -- For autocompletion
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  -- Symbols in autocompletion box
  use 'onsails/lspkind.nvim'
end)
