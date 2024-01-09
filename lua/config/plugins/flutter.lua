return {
	'akinsho/flutter-tools.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim',
	},
	config = true,
	vim.keymap.set('n', '<leader>k', '<cmd>Telescope flutter commands<CR>')
}
