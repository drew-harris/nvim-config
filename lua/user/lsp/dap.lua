require("mason-nvim-dap").setup({
	automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers({
	function(source_name)
		-- all sources with no handler get passed here

		-- Keep original functionality of `automatic_setup = true`
		require("mason-nvim-dap.automatic_setup")(source_name)
	end,
})

require("dapui").setup()
