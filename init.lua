-- Packer Manager
require("plugins-setup")
-- Files basic config
require("settings")
require("keymaps")
-- Theme
require("colorscheme")
-- Plugins
require("plugins.gitsigns")
require("plugins.lualine")
-- require("plugins.bufferline")
require("plugins.barbar")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.comment")
require("plugins.blankline")
require("plugins.colorizer")
require("plugins.autopairs")
require("plugins.treesitter")
require("plugins.which-key")
require("plugins.toggleterm")
require("plugins.dashboard")
require("plugins.notify")
-- LSP server
require("lsp.nvim-cmp") -- Completion
require("lsp.mason") -- LSP Installer
require("lsp.lspsaga")
require("lsp.lspconfig") -- LSP
require("lsp.null-ls") -- Formatter
require("lsp.diagnostic_signs") -- Signs
