local M = {}

-- mason related options
local options = {
	-- used by custom command to install defaults
  ensure_installed = {
    "lua-language-server",
    "rust-analyzer",
    "codelldb",
    "chrome-debug-adapter"
  }, 

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

function init()
  vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
  end, {})
end

M.options = options
M.init = init

return M
