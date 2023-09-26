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
keymap("n", "<leader>x", ":x<cr>", { noremap = true })
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
vim.keymap.set("n", "<C-Down>", "<C-W>j", { remap = true, silent = false })
vim.keymap.set("n", "<C-Up>", "<C-W>k", { remap = true, silent = false })
vim.keymap.set("n", "<C-Left>", "<C-W>h", { remap = true, silent = false })
vim.keymap.set("n", "<C-Right>", "<C-W>l", { remap = true, silent = false })

-- Split panels
-- keymap('n', '<leader>sh', ':split<cr>', { noremap = true }) -- horizontal split
-- keymap('n', '<leader>sv', ':vsplit<cr>', { noremap = true }) --vertical split

-- Buffers
keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
keymap("n", "<S-Tab>", ":bprev<cr>", { noremap = true })
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

-- key_mapping --
local key_map = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- run debug
function get_test_runner(test_name, debug)
	if debug then
		return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"'
	end
	return 'mvn test -Dtest="' .. test_name .. '"'
end

function run_java_test_method(debug)
	-- local utils = require("utils")
	-- local method_name = utils.get_current_full_method_name("\\#")
	local method_name = vim.fn.input("Method name: ")
	vim.cmd("term " .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
	-- local utils = require("utils")
	-- local class_name = utils.get_current_full_class_name()
	local class_name = vim.fn.input("Class name: ")
	vim.cmd("term " .. get_test_runner(class_name, debug))
end

function get_spring_boot_runner(profile, debug)
	local debug_param = ""
	if debug then
		debug_param =
			' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
	end

	local profile_param = ""
	if profile then
		profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
	end

	return "mvn spring-boot:run " .. profile_param .. debug_param
end

function run_spring_boot(debug)
	vim.cmd("term " .. get_spring_boot_runner(method_name, debug))
end

vim.keymap.set("n", "<leader>tm", function()
	run_java_test_method()
end)
vim.keymap.set("n", "<leader>TM", function()
	run_java_test_method(true)
end)
vim.keymap.set("n", "<leader>tc", function()
	run_java_test_class()
end)
vim.keymap.set("n", "<leader>TC", function()
	run_java_test_class(true)
end)
vim.keymap.set("n", "<F9>", function()
	run_spring_boot()
end)
vim.keymap.set("n", "<F10>", function()
	run_spring_boot(true)
end)

-- setup debug
key_map("n", "<leader>db", ':lua require"dap".toggle_breakpoint()<CR>')
key_map("n", "<leader>dB", ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
key_map("n", "<leader>bl", ':lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log: "))<CR>')
key_map("n", "<leader>dr", ':lua require"dap".repl.open()<CR>')

-- view informations in debug
function show_dap_centered_scopes()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end
key_map("n", "gs", ":lua show_dap_centered_scopes()<CR>")

-- move in debug
key_map("n", "<F8>", ':lua require"dap".continue()<CR>')
key_map("n", "<F6>", ':lua require"dap".step_over()<CR>')
key_map("n", "<F5>", ':lua require"dap".step_into()<CR>')
key_map("n", "<F7>", ':lua require"dap".step_out()<CR>')

function attach_to_debug()
	local dap = require("dap")
	dap.configurations.java = {
		{
			type = "java",
			request = "attach",
			name = "Attach to the process",
			hostName = "localhost",
			port = "5005",
		},
	}
	dap.continue()
end

key_map("n", "<leader>da", ":lua attach_to_debug()<CR>")
