require("indent_blankline").setup {
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard", "NvimTree", "packer", "lsp-installer"},
    how_current_context = true,
    show_current_context_start = true,
}
