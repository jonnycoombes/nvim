local M = {}

-- whick-keys related options go here
local options = {}

-- called during plugin setup
function init()
  vim.o.timeout = true
  vim.o.timeoutlen = 100
  local wk = require "which-key"

  -- top level mappings
  wk.register({
    T = { "<cmd>Telescope<cr>", "Telescope" },
    E = { "<cmd>NvimTreeFocus<cr>", "Focus Tree" },
    C = { "<cmd>checkhealth<cr>", "Check Health" },
		W = { "<cmd>TroubleToggle<cr>", "Trouble" },
  }, { prefix = "<leader>" })

  -- second level mappings
  wk.register({
    f = {
      name = "Find", -- optional group name
      f = { "<cmd>Telescope find_files<cr>", "File", noremap = false },
      r = { "<cmd>Telescope oldfiles<cr>", "Recents", noremap = false },
      b = { "<cmd>Telescope buffers<cr>", "Buffers", noremap = false },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols", noremap = false },
    },
    t = {
      name = "Tree",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
      o = { "<cmd>NvimTreeOpen<cr>", "Open" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
      c = { "<cmd>NvimTreeClose<cr>", "Close" },
    },
		r = {
			name = "Rust",
			h = { "<cmd>RustHoverActions<cr><cmd>RustHoverActions<cr>", "Hover Actions" },
			c = { "<cmd>RustCodeAction<cr>", "Code Actions" },
		},
  }, { prefix = "<leader>"})

end

M.init = init
M.options = options

return M
