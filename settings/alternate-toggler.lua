require("alternate-toggler").setup { }

local keymap = vim.keymap
keymap.set('n', '<space>ta', '<cmd>ToggleAlternate<cr>', { noremap = true, silent = true })