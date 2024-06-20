vim.g.mapleader = " "

<<<<<<< HEAD
=======
-- Function to copy to system clipboard in visual mode
local function copy_to_clipboard()
  vim.cmd('normal! "+y')
  print("Copied to clipboard")
end

-- Key mapping for visual mode
vim.api.nvim_set_keymap('v', '<leader>y', '<cmd>lua copy_to_clipboard()<CR>', { noremap = true, silent = true })

-- Optional: Add key mapping for normal mode to copy the entire line to clipboard
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yy', { noremap = true, silent = true })
>>>>>>> master
