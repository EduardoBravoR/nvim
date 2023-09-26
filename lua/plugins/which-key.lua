local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
	local float = Terminal:new({ direction = "float" })
	return float:toggle()
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true,
}

local mappings = {
	-- surround, replacewithbuffer, comment
	w = { ":w<cr>", "Write" },
	x = { ":x<cr>", "Wirte and Quit" },
	q = { ":q<cr>", "Quit" },
	Q = { ":q!<cr>", "Force Quit" },
	b = { name = "Buffer", c = { ":bd<cr>", "Buffer Close" } },
	e = { ":NvimTreeToggle<CR>", "File Explorer" },
	n = { ":nohl<cr>", "No Highlight" },
	r = { ":luafile %<cr>", "Reload Neovim" },
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		s = { "<cmd>Telescope live_grep<cr>", "Live Grep" }, -- use Live grep pacakge with rg command
		c = { "<cmd>Telescope grep_string<cr>", "Current String" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
	},
	s = {
		name = "Split Panels",
		v = { ":vsplit<cr>", "Split Vertical" },
		h = { ":split<cr>", "Split Horizontal" },
		e = { "<C-w>=", "Equal Width panels" },
		c = { ":close<cr>", "Close Panel" },
	},
	t = {
		name = "Terminal",
		t = { ":ToggleTerm<CR>", "Split Below" },
		f = { toggle_float, "Floating Terminal" },
	},
	p = {
		name = "Packer",
		C = { ":PackerClean<cr>", "Remove Unused Plugins" },
		c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
		i = { ":PackerInstall<cr>", "Install Plugins" },
		s = { ":PackerSync<cr>", "Sync Plugins" },
		S = { ":PackerStatus<cr>", "Packer Status" },
		u = { ":PackerUpdate<cr>", "Update Plugins" },
	},
	g = {
		name = "Git",
		n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		e = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	l = {
		name = "LSP",
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
		-- i = { ":LspInfo<cr>", "Connected Language Servers" },
		k = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		w = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add workspace folder" },
		W = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove workspace folder" },
		l = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			"List workspace folder",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code actions" },
		e = { "<cmd>lua vim.diagnostic.open_float({scope='line'})<CR>", "Show line diagnostics" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
		N = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
		I = { "<cmd>LspInstallInfo<cr>", "Install language server" },
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format File" },
		T = { "<cmd> Telescope diagnostics bufnr=0<CR>", "Get Diagnostics" },
	},
}
local opts = {
	prefix = "<leader>",
	mode = "n",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
wk.setup(setup)
wk.register(mappings, opts)
