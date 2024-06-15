return {
    'nvim-telescope/telescope.nvim', 
		tag = '0.1.6',
-- or                              , branch = '0.1.x',
    dependencies = {  'nvim-lua/plenary.nvim',
											"nvim-tree/nvim-web-devicons",
											"nvim-treesitter/nvim-treesitter",
											{"nvim-telescope/telescope-smart-history.nvim"},
									},

		config = function()
				local keymap = vim.keymap
				keymap.set("n","<leader>ff","<cmd>Telescope find_files<cr>", {desc = "Fuzzy find files in cwd"})
		end

}
