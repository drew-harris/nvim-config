local colorscheme = "github_dark_default"

require("github-theme").setup({
  transparent = true,
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

