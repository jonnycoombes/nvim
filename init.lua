local boot = require "boot"
local options = vim.o
local globals = vim.g

-- set global options
options.number = true
options.incsearch = true
options.hlsearch = true

-- prefer this to <space> or similar
globals.mapleader = ","

-- spacing etc...
options.shiftwidth = 2
options.tabstop = 2
options.wrap = false

-- boot everything up and get it configured
boot.init()

-- set the colour scheme
vim.cmd("colorscheme kanagawa")
