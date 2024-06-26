-- ~/.config/nvim/lua/dzejkob/lazy.lua
-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
<<<<<<< HEAD
  { import = "dzejkob.plugins" },
	require('dzejkob.plugins.lspconfig'),
=======
  { import = "dzejkob.plugins"},
  { import = "dzejkob.plugins.languages"},
	require('dzejkob.plugins.languages.lspconfig'),
>>>>>>> master
}, {
  notify = false,
})

