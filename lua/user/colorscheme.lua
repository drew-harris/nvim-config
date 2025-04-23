-- local colorscheme = "catppuccin-mocha"
local colorscheme = "sonokai"
-- local colorscheme = "kanagawa-dragon"
-- local colorscheme = "tokyonight"
-- local colorscheme = "github_dark"
-- local colorscheme = "gruvbox"
-- local colorscheme = "darcula-solid"
-- local colorscheme = "onedark"

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		local links = {
-- 			["@lsp.type.namespace"] = "@namespace",
-- 			["@lsp.type.type"] = "@type",
-- 			["@lsp.type.class"] = "@type",
-- 			["@lsp.type.enum"] = "@type",
-- 			["@lsp.type.interface"] = "@type",
-- 			["@lsp.type.struct"] = "@structure",
-- 			["@lsp.type.parameter"] = "@parameter",
-- 			["@lsp.type.variable"] = "@variable",
-- 			["@lsp.type.property"] = "@property",
-- 			["@lsp.type.enumMember"] = "@constant",
-- 			["@lsp.type.function"] = "@function",
-- 			["@lsp.type.method"] = "@method",
-- 			["@lsp.type.macro"] = "@macro",
-- 			["@lsp.type.decorator"] = "@function",
-- 		}
-- 		for newgroup, oldgroup in pairs(links) do
-- 			vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
-- 		end
-- 	end,
-- })

vim.cmd("highlight! link LspSignatureActiveParameter MatchParen")

---@diagnostic disable-next-line: param-type-mismatch
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
