local setup, comment = pcall(require, "nvim_comment")
if not setup then
    return
end
comment.setup({
    line_mapping = "<leader>cl",
    operator_mapping = "<leader>c",
    comment_chunk_text_object = "ic",
    comment_empty = false,
})
