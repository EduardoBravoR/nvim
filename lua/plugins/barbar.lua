local setup, bufferline = pcall(require, "bufferline")

if not setup then
	return
end

bufferline.setup({
	-- Enable/disable animations
	animation = true,
	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = true,
	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,
	-- Enable/disable close button
	closable = true,
	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,
	-- Enable/disable icons
	-- if set to 'numbers', will show buffer index in the tabline
	-- if set to 'both', will show buffer index and icons in the tabline
	icons = {
		filetype = { enabled = true },
		active_separator_left = "▎",
		inactive_separator_left = "▎",
		button = "",
		modified_button = "●",
		pinned_button = "車",
	},
	-- If set, the icon color will follow its corresponding buffer
	-- highlight group. By default, the Buffer*Icon group is linked to the
	-- Buffer* group (see Highlighting below). Otherwise, it will take its
	-- default value as defined by devicons.
	icon_custom_colors = false,
	-- Configure icons on the bufferline.
	-- icon_separator_active = "▎",
	-- icon_separator_inactive = "▎",
	-- icon_close_tab = "",
	-- icon_close_tab_modified = "●",
	-- icon_pinned = "車",
	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = true,
	insert_at_start = false,
	-- Sets the maximum buffer name length.
	maximum_length = 20,
})
