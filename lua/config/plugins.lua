local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require('lazy').setup({
	require('config.plugins.colorscheme'),
	require('config.plugins.telescope').config,
	require('config.plugins.yank'),
	require('config.plugins.debugger'),
	require('config.plugins.flutter'),
	require('config.plugins.ft'),
	require('config.plugins.indent'),
	require('config.plugins.winbar'),
	require('config.plugins.treesitter'),
	require('config.plugins.tabbar'),
	require('config.plugins.editor'),
	require('config.plugins.scrollbar'),
	require('config.plugins.git'),
	require('config.plugins.fun'),
	require('config.plugins.surround'),
	require('config.plugins.lspconfig').config,
	require('config.plugins.mason'),
	require('config.plugins.autocomplete').config,
	require('config.plugins.notify'),
	require('config.plugins.fzf'),
	require('config.plugins.statusbar'),
	require('config.plugins.snippets'),
	require('config.plugins.search'),
	require('config.plugins.comment'),
	require('config.plugins.project'),
	require('config.plugins.window-manager'),
	require('config.plugins.undo'),
	require('config.plugins.wilder'),
	require('config.plugins.tex'),
	require('config.plugins.markdown'),
	require('config.plugins.joshuto'),
	require('config.plugins.toggleterm'),
	-- require('config.plugins.startup'),
	require('config.plugins.neo-tree'),
	require('config.plugins.virtual-env'),
	require('config.plugins.copilot'),
})
