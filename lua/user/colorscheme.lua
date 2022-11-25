local colorscheme = "gruvbox"

require("github-theme").setup({
	transparent = false,
})

---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
