-- Files basic config
require('settings')
require('keymaps')
-- Plugins
require('plugins.plugins')
require('plugins.ayu')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.bufferline')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.comment')
require('plugins.blankline')
require('plugins.colorizer')
require('plugins.autopairs')
require('plugins.treesitter')
require('plugins.which-key')
-- LSP server
require('lsp.cmp')
require('lsp.diagnostic_signs')
require('lsp.language_servers')
-- Themes
-- vim.cmd [[colorscheme ayu-mirage]]
vim.cmd [[colorscheme onedark]]
