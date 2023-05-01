local o = vim.o --vim options
local opt = vim.opt -- Generals options (Windows/Files)
local cmd = vim.cmd -- for VimScript commands

-- Block cursor in all modes
vim.opt.guicursor = ""

-- vim.opt.listchars = { space = "_", tab = ">~" }
-- Listchars
vim.opt.list = true
vim.opt.listchars = {
	space = "⋅",
	eol = "↴",
}

-- Toggle kitty terminal padding
-- vim.cmd([[
-- augroup kitty_mp
--     autocmd!
--     au VimLeave * :silent !kitty @ set-spacing padding=6 margin=0
--     au VimEnter * :silent !kitty @ set-spacing padding=0 margin=0
-- augroup END
-- ]])

-- Nvim background transparent
-- vim.cmd([[au ColorScheme * hi Normal ctermbg=none guibg=none]])

-- Line numbers
opt.number = true -- Show the number line
opt.relativenumber = true -- Show relative number line

-- Tabs and indentation
opt.expandtab = true -- Enable on pressing tab, insert spaces
opt.tabstop = 4 -- Number of spaces when press tab in insert mode
opt.softtabstop = 4 -- Number of spaces when delete tab
opt.shiftwidth = 4 -- Number of spaces when press tab in normal mode
opt.smartindent = true -- Applies the identation of the current line to the next
opt.autoindent = true -- Reacts to the syntax/style of code (especially for C)

-- Line wrapping
opt.wrap = false
opt.linebreak = true -- Break words instead characters when wrapping

-- Search settings
opt.ignorecase = true -- Enable caps sensitive in searching
opt.smartcase = true
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Makes search act like search in modern browsers

-- Cursor Line
opt.cursorline = true -- Display a line where the cursor is

-- Appearance
opt.termguicolors = true
opt.bg = "dark"
opt.signcolumn = "yes"
opt.updatetime = 50 -- Launch a plugin trigger (time for update icons when delete, save)

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard = "unnamedplus" -- Allow using system clipboard with neovim (copy/paste)

-- Split Windows
opt.splitright = true -- Open split right
opt.splitbelow = true -- Open split below

-- Symbols as part of word
opt.iskeyword:append("-")

-- Scrolling
o.scrolloff = 5 -- Cursor position when scrolling up and down
o.sidescrolloff = 5 -- Cursor position when scrolling right and left. Works with wrap disable

-- Encoding
opt.encoding = "utf-8" -- The encoding written to terminal
opt.fileencoding = "utf-8" -- The encoding written to file

-- Files
cmd("filetype plugin indent on")
cmd("syntax on")
cmd("syntax enable") -- Highlight selected code

-- Command Bar
opt.showcmd = true -- Show the typed command
-- opt.cmdheight = 1
opt.showmode = false -- Show mode (view, insert, command)
opt.wildmenu = true
opt.wildmode = "longest:full,full" -- 'longest:list,full'
opt.wildoptions = "pum"
opt.pumheight = 10

-- Buffers
-- o.showtabline = 2 -- Show the buffers

-- Folding
opt.viewoptions = "folds,options,cursor,unix,slash" -- Better Unix / Windows compatibility
opt.showmatch = true
opt.foldmethod = "manual" -- Fold the code. First fold go to (){}[] y press zf%. Toggle after first fold press zfa

-- Status Bar
opt.laststatus = 2 -- Allow status bar

-- Replacement
opt.gdefault = true -- Add g (global) to substitute operations, :s/pattern/replacement/

-- Mouse
opt.mouse = "a" -- Enable the mouse
-- opt.mouse = "" -- Disbale the mouse

opt.magic = true -- For regular expressions turn magic on
o.list = false
