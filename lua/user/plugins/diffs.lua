return {
	"sindrets/diffview.nvim",

	dependencies = "nvim-telescope/telescope.nvim",

	opts = {
		default_args = {
			DiffviewOpen = { "--imply-local" },
		},
	},

	config = function()
		function search_git_commit()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			require("telescope.builtin").git_commits({
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						local selection = action_state.get_selected_entry()
						actions.close(prompt_bufnr)
						if selection then
							vim.cmd("DiffviewOpen " .. selection.value .. "^!")
							-- Return the commit hash
						end
					end)
					return true
				end,
			})
		end

		Keymapper("gds", search_git_commit, "Git Diff Search Telescope")
	end,
}
