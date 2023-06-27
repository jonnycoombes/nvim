local M = {}

function init()
  local wk = require "which-key"
  wk.register({
    t = {
      name = "Telescope", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File" }, 
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false}, 
    },
    T = {
	name = "Tree",
	t = {"<cmd>NvimTreeToggle<cr>", "Toggle"},
	o = {"<cmd>NvimTreeOpen<cr>", "Open"},
	f = {"<cmd>NvimTreeFocus<cr>", "Focus"},
	c = {"<cmd>NvimTreeClose<cr>", "Close"},
    },
  }, { prefix = "<leader>" })
end

M.init = init

return M
