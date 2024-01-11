local compile = function()
	vim.cmd("write")
	local filetype = vim.bo.filetype
	if filetype == "cpp" or filetype == "c" then
		os.execute("gcc " .. vim.fn.expand("%") .. " -g -o " .. vim.fn.expand("%<"))
	end
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"ravenxrz/DAPInstall.nvim",
				config = function()
					local dap_install = require("dap-install")
					dap_install.setup({
						installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
					})
				end
			},
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			-- "nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			-- dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			-- dap.listeners.before.event_exited["dapui_config"] = dapui.close

			local m = { noremap = true }
			vim.keymap.set("n", "<leader>'t", dap.toggle_breakpoint, m)
			vim.keymap.set("n", "<leader>'v", require('dap.ui.widgets').hover, m)
			vim.keymap.set("n", "<leader>'n", function()
				compile()
				dap.continue()
			end, m)
			vim.keymap.set("n", "<leader>'s", dap.step_over, m)
			local widgets = require('dap.ui.widgets')
			vim.keymap.set("n", "<leader>'q", dap.terminate, m)
			vim.keymap.set("n", "<leader>'u", dapui.toggle, m)

			vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
			vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
			vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#ffffff', bg = '#FE3C25' })

			vim.fn.sign_define('DapBreakpoint',
				{ text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
			vim.fn.sign_define('DapBreakpointCondition',
				{ text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
			vim.fn.sign_define('DapBreakpointRejected',
				{ text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
			vim.fn.sign_define('DapLogPoint', {
				text = '',
				texthl = 'DapLogPoint',
				linehl = 'DapLogPoint',
				numhl = 'DapLogPoint'
			})
			vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

			dap.adapters.codelldb = {
				type = 'server',
				port = "${port}",
				executable = {
					command = vim.g.codelldb_path,
					args = { "--port", "${port}" },
				}
			}
			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						local exe = vim.g.c_debug_program or vim.fn.expand("%:r")
						return vim.fn.getcwd() .. '/' .. exe
					end,
					cwd = '${workspaceFolder}',
					stopOnEntry = false,
				},
			}
			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			dap.adapters.kotlin = {
				type = "executable",
				command = "kotlin-debug-adapter",
				options = { auto_continue_if_many_stopped = false },
			}

			dap.configurations.kotlin = {
				{
					type = "kotlin",
					request = "launch",
					name = "This file",
					-- may differ, when in doubt, whatever your project structure may be,
					-- it has to correspond to the class file located at `build/classes/`
					-- and of course you have to build before you debug
					mainClass = function()
						local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
						local fname = vim.api.nvim_buf_get_name(0)
						-- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
						return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
					end,
					projectRoot = "${workspaceFolder}",
					jsonLogFile = "",
					enableJsonLogging = false,
				},
				{
					-- Use this for unit tests
					-- First, run
					-- ./gradlew --info cleanTest test --debug-jvm
					-- then attach the debugger to it
					type = "kotlin",
					request = "attach",
					name = "Attach to debugging session",
					port = 5005,
					args = {},
					projectRoot = vim.fn.getcwd,
					hostName = "localhost",
					timeout = 2000,
				},

			}

			local dap_install = require("dap-install")
			dap_install.config("codelldb", {})
		end
	}
}
--TODO: Fix the mass dap ui
