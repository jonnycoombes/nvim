local boot = require('boot')

-- set global options 
vim.o.number = true
vim.o.incsearch = true
vim.o.hlsearch = true

-- prefer this to <space> or similar
vim.g.mapleader = ','

-- spacing etc...
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- initialise plugins
boot.init()
