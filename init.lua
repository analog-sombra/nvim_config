require "options"
require "keymap"
require "lazyplugins"
vim.o.winbar = "%f%{%v:lua.require'nvim-navic'.get_location()%}"
