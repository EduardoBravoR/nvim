local o = vim.o --vim options
local wo = vim.wo -- values per windows
local bo = vim.bo -- values per buffers
local opt  = vim.opt -- Generals options (Windows/Files)
local g = vim.g -- Globals values
local env = vim.env -- Environment variables
local cmd = vim.cmd -- for VimScript commands
local key = vim.keymap -- for keymaps
local api = vim.api -- API VIM

g.mapleader = ' ' -- tecla lider, en este caso el espacio
opt.compatible = false
opt.mouse = 'a' --Para activar el mouse

-- Tabulation
opt.expandtab = true -- Enable on pressing tab, insert spaces
opt.tabstop = 2 -- Number of spaces when press tab in insert mode
opt.softtabstop = 2 -- Number of spaces when delete tab
opt.shiftwidth = 2 -- Number of spaces when press tab in normal mode

opt.clipboard = 'unnamedplus' --  Para poder utilizar el copy/paste fuera de la terminal

o.wrap = true
opt.linebreak = true -- Se corta en palabras y no en caracteres cuando wrap está puesto

opt.encoding = 'utf-8' -- The encoding written to terminal
opt.fileencoding = 'utf-8' -- The encoding written to file.
opt.cursorline = true -- Para que muestre el cursor donde estamos

cmd('filetype plugin indent on')
cmd('syntax on')
cmd('syntax enable') --para resaltar el codigo cuando lo seleccionamos

opt.number = true --para que me muestre los numeros de las lineas
opt.relativenumber = true -- para que me de el numero de lineas relativo

opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Makes search act like search in modern browsers
opt.ignorecase = true -- para innorar el key sensitive en las busquedas
opt.smartcase = true

opt.smartindent = true -- Applies the identation of the current line to the next
opt.autoindent = true -- Reacts to the syntax/style of code (especially for C)

opt.showcmd = true -- para mostrar los comandos que se escriben
o.showmode = false -- eliminamos que nos indique en que modo estamos (vista, insertar comando)
opt.wildmenu = true
opt.wildmode = 'longest:full,full' -- 'longest:list,full'
opt.wildoptions = 'pum'
opt.pumheight = 10

o.showtabline = 2 -- Show the buffers

vim.o.scrolloff = 3 -- Cuantas lineas abajo se posiciona el cursor cuando se hace scroll con el mouse
vim.o.sidescrolloff = 5 -- Cuantas lineas se pone en la derecha si esta desactivado el wrap cuando se hace scroll

opt.viewoptions = 'folds,options,cursor,unix,slash' -- Better Unix / Windows compatibility
opt.showmatch = true
opt.foldmethod = 'manual' -- para plegar y desplegar codigo. para hacer simple, vas al primer cierre del (){}[] y precionar zf% y listo, para desacoplar solo preciona zfa y listo.
opt.laststatus = 2 -- Allow status bar
opt.signcolumn = 'yes'
opt.updatetime = 50 -- Launch a plugin trigger (time for update icons when delete, save)
-- vim.o.timeoutlen = 100 -- Time for wait a key after pressing other one (command)

opt.gdefault = true -- Add g (global) to substitute operations, :s/pattern/replacement/
opt.splitbelow = true -- Open split below
opt.splitright = true -- Open split right
opt.magic = true -- For regular expressions turn magic on
o.list = false

opt.termguicolors = true
