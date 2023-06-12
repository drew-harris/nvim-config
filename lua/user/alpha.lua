local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

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

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
