return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	branch = "v3.x",
	config = function()
		require("neo-tree").setup({
			buffers = {
				window = {
					mappings = {
						["x"] = "buffer_delete",
					},
				},
			},

			window = {
				position = "right",
				mappings = {
					["<esc>"] = "close_window",
				},
			},

			filesystem = {
				hijack_netrw_behavior = "disabled",
			},

			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},

			source_selector = {
				winbar = true,
				-- statusline = true,
				sources = { -- table
					{
						source = "filesystem", -- string
						display_name = "  Files ", -- string | nil
					},
					{
						source = "buffers", -- string
						display_name = " 󰆏 Buffers ", -- string | nil
					},
					{
						source = "git_status", -- string
						display_name = "  Git ", -- string | nil
					},
					{
						source = "document_symbols", -- string
						display_name = " Symbols ", -- string | nil
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle reveal<cr>", { desc = "Neotree" })
	end,
}
