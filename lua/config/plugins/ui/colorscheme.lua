return {
	{
		"catppuccin/nvim",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false,        -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false,          -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15,        -- percentage of the shade to apply to the inactive window
				},
				no_italic = false,          -- Force no italic
				no_bold = false,            -- Force no bold
				no_underline = false,       -- Force no underline
				styles = {                  -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" },  -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = { "bold" },
					keywords = { "italic" },
					strings = { "underline" },
					variables = {},
					numbers = { "italic" },
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
				color_overrides = {},
				custom_highlights = {},
				integrations = {
					cmp = true,
					gitsigns = true,
					neotree = true,
					treesitter = true,
					notify = true,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
					dropbar = {
						enabled = false,
						color_mode = false, -- enable color for kind's texts, not just kind's icons
					},
					-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
			})
			vim.cmd.colorscheme 'catppuccin'
		end
	},

	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	lazy = false,  -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			style = "storm",    -- the theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
	-- 			light_style = "day", -- the theme is used when the background is set to light
	-- 			transparent = true, -- enable this to disable setting the background color
	-- 			terminal_colors = true, -- configure the colors used when opening a `:terminal` in [neovim](https://github.com/neovim/neovim)
	-- 			styles = {
	-- 				-- style to be applied to different syntax groups
	-- 				-- value is any valid attr-list value for `:help nvim_set_hl`
	-- 				comments = { italic = true },
	-- 				keywords = { italic = true },
	-- 				functions = {},
	-- 				variables = {},
	-- 				strings = { underline = true },
	-- 				-- background styles. can be "dark", "transparent" or "normal"
	-- 				sidebars = "dark",          -- style for sidebars, see below
	-- 				floats = "dark",            -- style for floating windows
	-- 			},
	-- 			sidebars = { "qf", "help" },  -- set a darker background on sidebar-like windows. for example: `["qf", "vista_kind", "terminal", "packer"]`
	-- 			day_brightness = 0.3,         -- adjusts the brightness of the colors of the **day** style. number between 0 and 1, from dull to vibrant colors
	-- 			hide_inactive_statusline = false, -- enabling this option, will hide inactive statuslines and replace them with a thin border instead. should work with the standard **statusline** and **lualine**.
	-- 			dim_inactive = false,         -- dims inactive windows
	-- 			lualine_bold = false,         -- when `true`, section headers in the lualine theme will be bold
	--
	-- 			--- you can override specific color groups to use other groups or a hex color
	-- 			--- function will be called with a colorscheme table
	-- 			---@param colors colorscheme
	-- 			on_colors = function(colors) end,
	--
	-- 			--- you can override specific highlights to use other groups or a hex color
	-- 			--- function will be called with a highlights and colorscheme table
	-- 			---@param highlights highlights
	-- 			---@param colors colorscheme
	-- 			on_highlights = function(highlights, colors) end,
	-- 		})
	--
	-- 		vim.cmd.colorscheme 'tokyonight'
	-- 	end,
	-- }
}
