local M = {}

-- whick-keys related options go here
local options = {}

-- called during plugin setup
function init()
  local wk = require "which-key"
  wk.register({
    t = {
      name = "Telescope", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "Find File", noremap = false },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },
      b = { "<cmd>Telescope buffers<cr>", "Buffers", noremap = false },
    },
    T = {
      name = "Tree",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
      o = { "<cmd>NvimTreeOpen<cr>", "Open" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
      c = { "<cmd>NvimTreeClose<cr>", "Close" },
    },
  }, { prefix = "<leader>" })
end

M.init = init
M.options = options

return M
