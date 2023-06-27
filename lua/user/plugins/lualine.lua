return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- code
		-- Make bottom bar transparent in the middle
		local auto_theme = require("lualine.themes.auto")

		local modes = {
			"normal",
			"insert",
			"visual",
			"replace",
			"inactive",
			"command",
			"terminal",
		}

		for _, editorMode in pairs(modes) do
			if auto_theme[editorMode] ~= nil and auto_theme[editorMode].c ~= nil then
				auto_theme[editorMode].c.bg = "#00000000"
			end
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = auto_theme,
				-- theme = require("user.theme.lualine").theme(),
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
