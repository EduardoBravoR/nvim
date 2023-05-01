local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	return
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})

treesitter.setup({
	ensure_installed = { "c", "cpp", "lua", "python", "javascript", "html", "java", "css", "json", "kotlin", "php" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = {
			"#e5c07b",
			"#c678dd",
			"#98c379",
			"#e06c75",
			"#61afef",
			"#abb2bf",
			"#282c34",
		}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	autopairs = { enable = true },
})
