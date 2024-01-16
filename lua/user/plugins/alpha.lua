return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[     _                            _                          _   ]],
			[[  __| |  _ __    ___  __      __ | |__        _ __     ___  | |_ ]],
			[[ / _` | | '__|  / _ \ \ \ /\ / / | '_ \      | '_ \   / _ \ | __|]],
			[[| (_| | | |    |  __/  \ V  V /  | | | |  _  | | | | |  __/ | |_ ]],
			[[ \__,_| |_|     \___|   \_/\_/   |_| |_| (_) |_| |_|  \___|  \__|]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}

		require("alpha").setup(dashboard.config)
	end,
}
