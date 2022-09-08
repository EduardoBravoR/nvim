local wk = require("which-key")
local mappings = {
  w = {":w<cr>", "Write"},
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save and Quit"},
  f = {"<cmd>Telescope find_files<cr>", "Find Files"},
  r = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
}
local opts = {
  prefix = '<leader>'
}
wk.register(mappings, opts)
