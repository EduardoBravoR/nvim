local keymap = vim.api.nvim_set_keymap
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    layout_config = {
      width = 0.75,
      prompt_position = "top",
      preview_cutoff = 120,
      horizontal = {mirror = false},
      vertical = {mirror = false}
    },
    find_command = {
      'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '-u'
    },
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}
--local sorters, actions, previewers =
--require('telescope.sorters'), require('telescope.actions'), require('telescope.previewers')
--
--local rip_grep_config = {
--        'rg',
--        '--no-heading',
--        '--with-filename',
--        '--line-number',
--        '--column',
--        '--smart-case',
--}
--
---- Setup Telescope
--local telescope = require('telescope')
--
--telescope.setup({
--        defaults = {
--                vimgrep_arguments = rip_grep_config,
--                layout_strategy = 'horizontal',
--                layout_config = {
--                        vertical = { width = 0.95, anchor=2 },
--			prompt_position = 'top'
--                },
--                initial_mode = 'insert',
--                prompt_prefix = ' ❯ ',
--                file_ignore_patterns = { '.git/*', 'node_modules', 'env/*' },
--                shorten_path = true,
--		color_devicons = true,
--                winblend = 20,
--                file_sorter = sorters.get_fzy_sorter,
--                generic_sorter = sorters.get_fzy_sorter,
--                file_previewer = previewers.vim_buffer_cat.new,
--                grep_previewer = previewers.vim_buffer_vimgrep.new,
--                qflist_previewer = previewers.vim_buffer_qflist.new,
--                mappings = {
--                        i = {
--                                --['<C-j>'] = actions.move_selection_next,
--                                --['<C-k>'] = actions.move_selection_previous,
--                                --['<Esc>'] = actions.close,
--                        },
--                },
--        },
--        extensions = {
--                -- Fast, fast, really fast sorter
--                fzy_native = {
--                        override_generic_sorter = false,
--                        override_file_sorter = true,
--                },
--        },
--})

keymap('n','<leader>f', ':Telescope find_files<CR>', {noremap = true})
keymap('n','<leader>g', ':Telescope live_grep<CR>', {noremap = true})
