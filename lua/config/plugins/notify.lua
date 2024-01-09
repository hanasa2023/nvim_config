return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		vim.notify = notify
		notify.setup({
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "rounded" })
			end,
			background_colour = "#202020",
			fps = 60,
			level = 2,
			minimum_width = 50,
			render = "compact",
			stages = "fade_in_slide_out",
			timeout = 3000,
			top_down = true
		})
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", ",;", function()
			require('telescope').extensions.notify.notify({
				layout_strategy = 'vertical',
				layout_config = {
					width = 0.9,
					height = 0.9,
					-- preview_height = 0.1,
				},
				wrap_results = true,
				previewer = false,
			})
		end, opts);
		vim.keymap.set("n", "<LEADER>c;", notify.dismiss, opts);
	end
}
--[[ return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
} ]]
