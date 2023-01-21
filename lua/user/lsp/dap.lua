local dap = require("dap")
require("mason-nvim-dap").setup({
	automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers({
	function(source_name)
		-- all sources with no handler get passed here

		-- Keep original functionality of `automatic_setup = true`
		require("mason-nvim-dap.automatic_setup")(source_name)
	end,

	firefox = function(source_name)
		dap.adapters.firefox = {
			type = "executable",
			command = "node",
			args = { "/Users/drew/programs/vscode-firefox-debug/dist/adapter.bundle.js" },
		}

		dap.configurations.typescript = {
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:5173",
				webRoot = "${workspaceFolder}",
				firefoxExecutable = "/Applications/Firefox.app/Contents/MacOS/firefox",
			},
		}
		dap.configurations.typescriptreact = {
			{
				name = "Debug with Firefox",
				type = "firefox",
				request = "launch",
				reAttach = true,
				url = "http://localhost:5173",
				webRoot = "${workspaceFolder}",
				firefoxExecutable = "/Applications/Firefox.app/Contents/MacOS/firefox",
			},
		}
	end,
})

require("dapui").setup()
