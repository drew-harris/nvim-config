return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- calling `setup` is optional for customization
		local fzf = require("fzf-lua")
		fzf.setup({})

		vim.keymap.set("n", "<leader>f", function()
			fzf.files({ winopts = { row = 1 } })
		end, { desc = "Find Files" })

		vim.keymap.set("n", "<leader>ss", function()
			fzf.builtin({ winopts = { row = 1 } })
		end, { desc = "Find Files" })
	end,
}
