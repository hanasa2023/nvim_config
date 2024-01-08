local mode = { noremap = true, nowait = true }
local telescope = {}

telescope.config = {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				"LukasPietzschmann/telescope-tabs",
				config = function()
					local tstabs = require('telescope-tabs')
					tstabs.setup({
					})
					-- vim.keymap.set('n', '<c-t>', tstabs.list_tabs, {})
				end
			},
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			-- "nvim-telescope/telescope-ui-select.nvim",
			'stevearc/dressing.nvim',
			'dimaportenko/telescope-simulators.nvim',
		},
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<c-p>', builtin.find_files, mode)
			-- vim.keymap.set('n', '<c-f>', function()
			-- 	builtin.grep_string({ search = "" })
			-- end, m)
			vim.keymap.set('n', '<leader>rs', builtin.resume, mode)
			vim.keymap.set('n', '<c-w>', builtin.buffers, mode)
			vim.keymap.set('n', '<c-h>', builtin.oldfiles, mode)
			vim.keymap.set('n', '<c-_>', builtin.current_buffer_fuzzy_find, mode)
			vim.keymap.set('n', 'z=', builtin.spell_suggest, mode)

			vim.keymap.set('n', '<leader>d', function()
				builtin.diagnostics({
					severity_sort = true,
				})
			end, mode)
			-- vim.keymap.set('n', 'gd', builtin.lsp_definitions, m)
			-- vim.keymap.set('n', '<c-t>', builtin.lsp_document_symbols, {})
			vim.keymap.set('n', 'gi', builtin.git_status, mode)
			-- vim.keymap.set("n", ":", builtin.commands, mode)
			vim.keymap.set('n', '<c-M>', builtin.quickfix, mode)

			local trouble = require("trouble.providers.telescope")

			local ts = require('telescope')
			local actions = require('telescope.actions')
			telescope.ts = ts
			ts.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--fixed-strings",
						"--smart-case",
						"--trim",
					},
					layout_config = {
						width = 0.9,
						height = 0.9,
					},
					mappings = {
						i = {
							["<C-h>"] = "which_key",
							["<C-j>"] = "move_selection_previous",
							["<C-k>"] = "move_selection_next",
							["<C-u>"] = "preview_scrolling_up",
							["<C-y>"] = "preview_scrolling_down",
							["<esc>"] = "close",
							["<C-n>"] = require('telescope.actions').cycle_history_next,
							["<C-p>"] = require('telescope.actions').cycle_history_prev,
						}
					},
					color_devicons = true,
					prompt_prefix = "🔍 ",
					selection_caret = " ",
					path_display = { "truncate" },
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
							},
						}
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					command_palette = command_palette,
				}
			})
			ts.load_extension("yank_history")
			ts.load_extension('dap')
			ts.load_extension('telescope-tabs')
			ts.load_extension('fzf')
			ts.load_extension('simulators')

			require("simulators").setup({
				android_emulator = true,
				apple_simulator = false,
			})
			-- ts.load_extension("ui-select")
			ts.load_extension("flutter")
			local tsdap = ts.extensions.dap;
			-- vim.keymap.set("n", "<leader>'v", tsdap.variables, m)
			-- vim.keymap.set("n", "<leader>'a", tsdap.commands, m)
			-- vim.keymap.set("n", "<leader>'b", tsdap.list_breakpoints, m)
			-- vim.keymap.set("n", "<leader>'f", tsdap.frames, m)
		end
	},
	{
		"FeiyouG/commander.nvim",
		config = function()
			local commander = require("commander")
			commander.setup({
				telescope = {
					enable = true,
				},
			})
			vim.keymap.set('n', '<c-q>', require("commander").show, mode)
			commander.add(
				require('config.plugins.commands')
			)
		end
	}
}

return telescope
