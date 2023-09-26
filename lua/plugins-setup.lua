-- Automatically installation
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand to install missing, update or remove unused plugins in neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- Complement for other plugins
		use("nvim-lua/plenary.nvim")

		-- Themes
		use("Shatur/neovim-ayu")
		use("bluz71/vim-nightfly-guicolors")
		use({ "ellisonleao/gruvbox.nvim" })
		use("navarasu/onedark.nvim")
		use({ "catppuccin/nvim", as = "catppuccin" })

		-- Icons
		use("kyazdani42/nvim-web-devicons")

		-- Info decorations
		use("lewis6991/gitsigns.nvim")

		-- Status line
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Buffers
		-- use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })
		use({
			"romgrk/barbar.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- File explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons",
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})

		-- Fuzzy finding
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- Dependency for better performance
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { { "nvim-lua/plenary.nvim" } },
		}) -- Fuzzy finder

		-- Comments
		use("terrortylor/nvim-comment")

		-- Surround
		use("tpope/vim-surround")

		-- Replace
		use("vim-scripts/ReplaceWithRegister")

		-- Indent line
		use("lukas-reineke/indent-blankline.nvim")

		-- RGB, HEX colors
		use("norcalli/nvim-colorizer.lua")

		-- Autocomplete parenthesis and brackets
		use("windwp/nvim-autopairs")

		-- Syntax highlighting and colors
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})

		-- Autotag for html. Its config is on treesitter
		use({ "windwp/nvim-ts-autotag" })

		-- Rainbow for colorized brackets. Its config in on treesitter
		use({ "p00f/nvim-ts-rainbow" })

		-- List the keybindings
		use("folke/which-key.nvim")

		-- Manager/Installer LSP servers
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- lsp for java
		use({ "mfussenegger/nvim-jdtls" })

		--Debugging java
		use("mfussenegger/nvim-dap")
		use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
		use("rcarriga/cmp-dap")

		-- LSP servers
		use("neovim/nvim-lspconfig")

		-- Code actions (keybindings)
		use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis (For lsp keybindings)

		-- Additional to typescript
		use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

		-- Autocompletion
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/nvim-cmp")

		-- Snippets
		use("L3MON4D3/LuaSnip") -- snippet engine
		use("saadparwaiz1/cmp_luasnip") -- for autocompletion
		use("rafamadriz/friendly-snippets") -- useful snippets

		-- Formatting
		use("jose-elias-alvarez/null-ls.nvim")
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

		-- Symbols in autocompletion box
		use("onsails/lspkind.nvim")

		-- Terminal
		use("akinsho/toggleterm.nvim")

		-- Notifications
		use("rcarriga/nvim-notify")

		-- Dashboard
		use("glepnir/dashboard-nvim")
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	-- To floating packer window
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
