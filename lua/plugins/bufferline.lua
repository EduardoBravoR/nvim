local setup, bufferline = pcall(require, "bufferline")

if not setup then
	return
end

bufferline.setup({
	options = {
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		truncate_names = true, -- whether or not tab names should be truncated
		-- tab_size = 18,
		separator_style = "thin", --"slant",
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})
