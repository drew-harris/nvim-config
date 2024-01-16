return {
	"nvim-lualine/lualine.nvim",
	config = function()
		-- code
		-- Make bottom bar transparent in the middle
		local auto_theme = require("lualine.themes.auto")

		vim.api.nvim_set_var("lspsaga_statusline_enabled", true)

		local function saga()
			-- Check if enabled
			local enabled = vim.api.nvim_get_var("lspsaga_statusline_enabled")

			if enabled == nil or enabled == false then
				return ""
			end

			local bar = require("lspsaga.symbol.winbar").get_bar()
			if bar ~= nil then
				return bar
			end
			return ""
		end

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
				component_separators = { left = " ", right = " " },
				section_separators = { left = " ", right = "" },
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				globalstatus = true,
				always_divide_middle = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				-- lualine_c = { { "filename", path = 1 } },
				lualine_c = { saga },
				lualine_x = { { "diagnostics", sources = { "nvim_lsp" } } },
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
			winbar = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			inactive_winbar = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
			extensions = {},
		})
	end,
}
