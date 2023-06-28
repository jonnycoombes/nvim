local dap = require "dap"
local dapui = require 'dapui'
local M = {}

-- use vscode-chrome-debug for chrome debugging
local function init_vscode_chrome()
  -- adapter
  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv "HOME" .. "Src/vscode-chrome-debug/out/src/chromeDebug.js" },
  }

  -- configuration
  dap.configurations.typescriptreact = { -- change to typescript if needed
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end

local function init_codelldb()
  -- server must be running
  dap.adapters.codelldb = {
    type = "server",
    host = "127.0.0.1",
    port = 13000, -- 💀 Use the port printed out or specified with `--port`
  }

  -- base configuration
  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
      end,
			args = {"--print"},
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

  -- duplicate the basic configuration for rust and C
  dap.configurations.rust = dap.configurations.cpp
  dap.configurations.c = dap.configurations.c
end

local function init()

	-- setup DAP UI
	dapui.setup()

  -- Chrome JS/TS
  init_vscode_chrome()

  -- Code LLDB
  init_codelldb()
end

M.init = init

return M
