function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

return {
	-- amongst your other plugins
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		-- config = function()
		-- 	local Terminal = require('toggleterm.terminal').Terminal
		-- 	local zsh = Terminal:new({
		-- 		hidden = true,
		-- 		dir = '%:p:h',
		-- 		float_opts = {
		-- 			border = 'curved',
		-- 		},
		-- 		direction = 'horizontal',
		-- 		auto_scroll = true,
		-- 	})
		-- 	function _zsh_toggle()
		-- 		zsh:toggle()
		-- 	end
		-- end,
		opts = {
			-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'),
			vim.keymap.set('n', '<leader>z', ':ToggleTerm dir=%:p:h<CR>', { buffer = 0 })
			-- vim.keymap.set('n', '<c-j>', '<cmd>lua _zsh_toggle()<CR>', { buffer = 0 })
		},
	}
}
