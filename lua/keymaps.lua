local api = vim.api
local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd

keymap('n', '<leader>w', ':w<CR>', {noremap = true})
keymap('n', '<leader>q', ':q<CR>', {noremap = true})
keymap('n', '<leader>Q', ':wq<CR>', {noremap = true})
keymap('n', '<C-a>', 'ggVG', {noremap = true})

keymap('n', 'n', 'nzzzv', { noremap = true }) -- focuses searches

cmd('autocmd InsertEnter * :let @/ = ""')
cmd('autocmd InsertLeave * :let @/ = ""')

cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

cmd [[
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
]]

keymap('n', '<C-u>', '10<C-Up>', {noremap = true})
keymap('n', '<C-e>', '10<C-Down>', {noremap = true})

keymap('n', '<C-Down>', '<C-W>j', {noremap = true, silent = false})
keymap('n', '<C-Up>', '<C-W>k', {noremap = true, silent = false})
keymap('n', '<C-Left>', '<C-W>h', {noremap = true, silent = false})
keymap('n', '<C-Right>', '<C-W>l', {noremap = true, silent = false})

keymap('n', '<leader>h', ':split<CR>', { noremap = true }) -- horizontal split
keymap('n', '<leader>v', ':vsplit<CR>', {noremap = true}) --vertical split

keymap('n','<Tab>', ':bnext<CR>', { noremap = true })
keymap('n','<S-Tab>', ':bprev<CR>', { noremap = true })
keymap('n','<leader>bc', ':bd<CR>', { noremap = true })
keymap('n','<leader>s', ':source %<CR>', {noremap = true})

-- Indent the code
keymap('v','<','<gv', {noremap = true, silent = true})
keymap('v','>','>gv', {noremap = true, silent = true})
