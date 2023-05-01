local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")

if not autopairs_setup then
	return
end

autopairs.setup({
	check_ts = true,
	-- map_cr = true,
	ts_config = {
		lua = { "string" },
		javascript = { "templtate_string" },
		java = false,
	},
})
local cmp_autopairs_setup, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not cmp_autopairs_setup then
	return
end

local cmp_setup, cmp = pcall(require, "cmp")

if not cmp_setup then
	return
end
-- If you want insert `(` after select function or method item
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
