-- a table of lazy plugins. Each plugin may have additional configuration
-- contained within imported modules above
return {
  {
    "tpope/vim-fugitive",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", '"', "'", "`", "c", "v", "g" },
    lazy = true,
    config = function(_)
      require("which-key").setup {
        -- initialise key bindings lazily
        require("conf.keys").init(),
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function(_)
      require("conf.mason").init()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function(_)
      require("conf.cmp").init()
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "1.2.1", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function(_)
      require("conf.lsp").init()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_)
      require("conf.lualine").init()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function(_)
      require("conf.gitsigns").init()
    end,
  },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function(_)
		end
	}
}
