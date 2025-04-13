return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local auto_theme = require("lualine.themes.seoul256")

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
				-- theme = auto_theme,
				theme = require("user.theme.lualine").theme(),
				-- component_separators = { left = "| ", right = " |" },
				-- section_separators = { left = " ", right = "" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {
						"neo-tree",
					},
				},
				ignore_focus = {},
				globalstatus = true,
				always_divide_middle = true,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "tabs" },
				lualine_b = { "diff" },
				-- lualine_c = { { "filename", path = 1 } },
				-- lualine_c = { saga },
				lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				-- lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_b = { "grapple" },
			},
			inactive_winbar = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			extensions = {
				-- "quickfix",
				-- "symbols-outline",
				-- "trouble",
			},
		})
	end,
}
