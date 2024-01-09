return {
	'linux-cultist/venv-selector.nvim',
	dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
	config = function()
		require('venv-selector').setup {
			-- Your options go here
			-- name = "venv",
			-- auto_refresh = false
			anaconda_base_path = '/opt/miniconda3',
			anaconda_envs_path = '/home/hanasa/miniconda3',
		}
	end,
	event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ '<leader>vs', '<cmd>VenvSelect<cr>' },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ '<leader>vc', '<cmd>VenvSelectCached<cr>' },
	},
}
