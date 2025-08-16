vim.g.mapleader = " "

vim.api.nvim_set_keymap('v', '<leader>y', [["+y :lua print("Copied to clipboard")<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yy', { noremap = true, silent = true })

