local setup, blankline = pcall(require, "indent_blankline")

if not setup then
	return
end

blankline.setup({
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "packer", "lsp-installer" },
	how_current_context = true,
	show_current_context_start = true,
	show_end_of_line = true,
	space_char_blankline = " ",
})
