return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set('n', '<c-t>', ':Neotree dir=%:p:h:h reveal_file=%:p<CR>')
		vim.keymap.set('n', '<c-c>', ':Neotree close<CR>')
	end
}
