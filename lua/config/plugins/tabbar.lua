return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			mode = "tabs",
			numbers = 'ordinal',
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			custom_filter = function(buf_number, buf_numbers)
				if vim.fn.bufname(buf_number) and vim.bo[buf_number].filetype ~= 'wiki' then
					return true
				end
			end,
			offsets = {
				{
					filetype = 'neo-tree',
					text = 'Hanasa\'s file explore',
					text_align = 'left',
					separator = true,
				}
			},
			indicator = {
				icon = '▎', -- this should be omitted if indicator style is not 'icon'
				-- style = 'icon' | 'underline' | 'none',
				style = "icon",
			},
			show_buffer_close_icons = true,
			show_close_icon = true,
			enforce_regular_tabs = true,
			show_duplicate_prefix = false,
			tab_size = 16,
			padding = 0,
			separator_style = "thick",
		},
	},
	vim.keymap.set('n', '<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>'),
	vim.keymap.set('n', '<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>'),
	vim.keymap.set('n', '<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>'),
	vim.keymap.set('n', '<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>'),
	vim.keymap.set('n', '<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>'),
	vim.keymap.set('n', '<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>'),
	vim.keymap.set('n', '<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>'),
	vim.keymap.set('n', '<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>'),
	vim.keymap.set('n', '<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>'),
	vim.keymap.set('n', '<leader>0', '<Cmd>BufferLineGoToBuffer -1<CR>'),
}
