local colorscheme = "github_dark_default"
-- local colorscheme = "gruvbox"

require("github-theme").setup({
	transparent = true,
})

if colorscheme == "onedark" then
	require("onedarkpro").setup({
		options = {
			transparency = true,
		},
	})
end

require("catppuccin").setup({
	transparent_background = true,
})

---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
