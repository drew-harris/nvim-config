return {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 15,
			diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
			diagnostics_update_in_insert = false,
			custom_filter = function(buf_number)
				-- filter out by buffer name
				if vim.fn.bufname(buf_number) == "[dap-repl]" then
					return false
				end
				-- filter out based on arbitrary rules
				-- e.g. filter out vim wiki buffer from tabline in your work repo
				return true
			end,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' }, | "padded" | "slant"
			enforce_regular_tabs = false,
			always_show_bufferline = true,
		},
	},
}
