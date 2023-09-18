local M = {}

local on_attach = function(client, bufnr)

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

local options = {}

function init()
  local lspconfig = require "lspconfig"
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  -- rust
  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- lua
  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- typescript
  lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- markdown
  lspconfig.marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

	-- tailwind
	lspconfig.tailwindcss.setup {
		on_attach = on_attach,
	 capabilities = capabilities
	 }
end

M.options = options
M.init = init

return M
