local telescope = require("telescope")
local fb = telescope.extensions.file_browser
local picker = fb.file_browser

picker({
	files = true,
	grouped = true,
})
