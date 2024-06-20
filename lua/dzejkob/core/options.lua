local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4          -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 2       -- 2 spaces for indent width
opt.autoindent = true    -- Copy indent from current line when starting new one

-- Line wrapping
opt.wrap = false         -- Disable line wrapping

-- Search settings
opt.ignorecase = true    -- Ignore case when searching
opt.smartcase = true     -- If mixed case is included in the search, assumes you want case-sensitive

<<<<<<< HEAD
=======
opt.clipboard:append("unnamedplus")
>>>>>>> master
-- Enable transparent background
vim.cmd [[
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
  highlight LineNr ctermbg=none guibg=none
  highlight Folded ctermbg=none guibg=none
  highlight EndOfBuffer ctermbg=none guibg=none
]]

