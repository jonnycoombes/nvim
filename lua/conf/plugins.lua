-- a table of lazy plugins. Each plugin may have additional configuration
-- contained within imported modules above

return {

  -- colour schemes
  { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- git related
  {
    "tpope/vim-fugitive",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function(_)
      require("conf.gitsigns").init()
    end,
  },

  -- some themeing
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  -- used for most user-defined key maps/bindings
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

  -- get some completion on neovim internals etc...
  { "folke/neodev.nvim", opts = {} },

  -- it's a fucking must have
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- here comes...
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- nice tree, friendly tree
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

  -- wrangle those fucking LSPs
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function(_)
      require("conf.mason").init()
    end,
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

  -- DAP (Debug Adapter Protocol)
  {
    "mfussenegger/nvim-dap",
    config = function(_)
      require("conf.dap").init()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
  },

  -- completion and snips
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
    version = "1.2.1",
  },

  -- status diddlin'
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(_)
      require("conf.lualine").init()
    end,
  },

  -- for parsing and generally being supportive
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_) end,
  },

  -- what every old person wants
  {
    "easymotion/vim-easymotion",
    lazy = false,
  },

  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    config = function(_)
      require("conf.rust-tools").init()
    end,
  },
}
