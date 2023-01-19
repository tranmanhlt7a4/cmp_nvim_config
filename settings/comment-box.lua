local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- left aligned fixed size box with left aligned text
keymap("n", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", opts)
keymap("v", "<Leader>bb", "<Cmd>lua require('comment-box').lbox()<CR>", opts)

-- centered adapted box with centered text
keymap("n", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", opts)
keymap("v", "<Leader>bc", "<Cmd>lua require('comment-box').accbox()<CR>", opts)

-- centered line
keymap("n", "<Leader>bl", "<Cmd>lua require('comment-box').cline()<CR>", opts)
keymap("i", "<M-l>", "<Cmd>lua require('comment-box').cline()<CR>", opts)

-- -- NOTE: Use :CBcatalog to get the code type of comment box and map it if necessary
-- -- A box with the text centered and the predefined type of box n°10:
-- :CBcbox10
-- -- or
-- :lua require("comment-box").cbox(10)

-- -- A line with the predefined type of line n°4:
-- :CBline4
-- -- or
-- :lua require("comment-box").line(4)