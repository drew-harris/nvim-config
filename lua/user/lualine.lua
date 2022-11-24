local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

-- Make bottom bar transparent in the middle
local auto_theme = require("lualine.themes.auto")
auto_theme.normal.c.bg = "#00000000"
auto_theme.insert.c.bg = "#00000000"
auto_theme.visual.c.bg = "#00000000"
auto_theme.replace.c.bg = "#00000000"
auto_theme.inactive.c.bg = "#00000000"
auto_theme.command.c.bg = "#00000000"
auto_theme.terminal.c.bg = "#00000000"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = auto_theme,
		-- component_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },

		-- section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = { "filename" },
		lualine_y = { diff, spaces, filetype },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_x = { "encoding", "fileformat", "filetype" },
		-- lualine_c = { "filename" },
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
