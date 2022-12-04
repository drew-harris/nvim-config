local colorscheme = "github_dark_default"

require("github-theme").setup({
	transparent = true,
})

require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	dark_variant = "main",
	bold_vert_split = false,
	dim_nc_background = true,
	disable_background = true,
	disable_float_background = false,
	disable_italics = true,
})

---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
