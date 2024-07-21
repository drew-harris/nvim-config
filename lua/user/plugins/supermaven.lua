return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			disable_keymaps = true,
		})
		local cmp = require("cmp")
		local suggestion = require("supermaven-nvim.completion_preview")

		vim.api.nvim_create_user_command("CopilotMagic", function()
			cmp.close()
			if suggestion.is_visible() then
				suggestion.accept()
			else
				suggestion.next()
			end
		end, {})
	end,
}
