local nnoremap = require("albin.keymap").nnoremap

-- netrw
nnoremap("<leader>e", "<cmd>Ex<CR>")

-- git stuff
nnoremap("<leader>gd", "<cmd>Git diff<CR>")
nnoremap("<leader>gs", "<cmd>Git status<CR>")
nnoremap("<leader>ga", ":Git add ")
nnoremap("<leader>gc", ":Git commit -m ''")

