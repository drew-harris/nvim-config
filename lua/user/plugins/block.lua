return {
	"HampusHauffman/block.nvim",
	config = function()
		require("block").setup({
			percent = 0.8,
			depth = 4,
			colors = nil,
			automatic = false,
			--      bg = nil,
			--      colors = {
			--          "#ff0000"
			--          "#00ff00"
			--          "#0000ff"
			--      },
		})
	end,
}
