local M = {}

local options = {}

local function init()
	require('gitsigns').setup()
end

M.options = options
M.init = init

return M
