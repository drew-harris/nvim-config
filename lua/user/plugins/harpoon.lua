return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			tabline = true,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
			enter_on_sendcmd = true,
			global_settings = {
				tabline = true,
				tabline_prefix = "   ",
				tabline_suffix = "   ",
				enter_on_sendcmd = true,
			},
		})
	end,
}
