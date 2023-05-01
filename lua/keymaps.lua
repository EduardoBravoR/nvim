-- Leader Key
vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- Disable Highlight
keymap("n", "<leader>n", ":nohl<cr>", { noremap = true, silent = true })
cmd('autocmd InsertEnter * :let @/ = ""')
cmd('autocmd InsertLeave * :let @/ = ""')

-- Write and Exit
keymap("n", "<leader>w", ":w<cr>", { noremap = true })
keymap("n", "<leader>q", ":q<cr>", { noremap = true })
keymap("n", "<leader>Q", ":q!<cr>", { noremap = true })
keymap("n", "<C-a>", "ggVG", { noremap = true })

-- Searching
keymap("n", "n", "nzzzv", { noremap = true }) -- focuses searches

-- Trim spaces
cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

cmd([[
augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
]])

-- Speed movement
keymap("n", "<C-u>", "10<C-Up>", { noremap = true })
keymap("n", "<C-e>", "10<C-Down>", { noremap = true })

-- Movement among panels
keymap("n", "<C-Down>", "<C-W>j", { noremap = true, silent = false })
keymap("n", "<C-Up>", "<C-W>k", { noremap = true, silent = false })
keymap("n", "<C-Left>", "<C-W>h", { noremap = true, silent = false })
keymap("n", "<C-Right>", "<C-W>l", { noremap = true, silent = false })

-- Split panels
-- keymap('n', '<leader>sh', ':split<cr>', { noremap = true }) -- horizontal split
-- keymap('n', '<leader>sv', ':vsplit<cr>', { noremap = true }) --vertical split

-- Buffers
keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
keymap("n", "<S-Tab>", ":bprev<cr>", { noremap = true })
keymap("n", "<leader>x", ":bd<cr>", { noremap = true })
-- keymap('n', '<leader>s', ':source %<cr>', {noremap = true})
-- :luafile %<cr>

-- keymap('n', '<leader>t', ':6sp term://zsh<cr>i', { noremap = true, silent=true })

-- NvimTree plugin
-- keymap('n', '<leader>e', ':NvimTreeToggle<cr>', { noremap = true })

-- Telescope plugin
-- keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true })
-- keymap('n', '<leader>fs', ':Telescope live_grep<cr>', { noremap = true })
-- keymap('n', '<leader>fc', ':Telescope grep_string<cr>', { noremap = true })
-- keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true })
-- keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true })

-- keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts)

-- Indent the code
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Surround code
-- ysw" insert
-- dsw" delete
-- csw" change

-- Replace with register
-- grw
-- grr line
