return {
	{
		"dart-lang/dart-vim-plugin",
		ft = "dart",
		lazy = false,
		config = function()
			vim.g.dart_corelib_highlight = false
			vim.g.dart_format_on_save = false
		end
	}
}
