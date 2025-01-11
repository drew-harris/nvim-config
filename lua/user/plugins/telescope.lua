return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-live-grep-args.nvim",
		"debugloop/telescope-undo.nvim",
		"molecule-man/telescope-menufacture",
		"ThePrimeagen/harpoon",
		"nvim-telescope/telescope-file-browser.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node%_modules/.*" },
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },

				mappings = {
					i = {
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,

						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,

						["<C-c>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
					},

					n = {
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-x>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["H"] = actions.move_to_top,
						["M"] = actions.move_to_middle,
						["L"] = actions.move_to_bottom,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["?"] = actions.which_key,
					},
				},
			},
			pickers = {
				-- Enable live colorscheme preview
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				-- Your extension configuration goes here:
				-- extension_name = {
				--   extension_config_key = value,
				-- }
				-- please take a look at the readme of the extension you want to configure
				menufacture = {
					mappings = {
						main_menu = { [{ "i", "n" }] = "<C-\\>" },
					},
				},

				file_browser = {
					mappings = {
						["i"] = {
							["<C-c>"] = fb_actions.create,
							["<C-b>"] = fb_actions.toggle_browser,
							["<C-d>"] = fb_actions.remove,
						},
					},
				},
			},
		})

		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("menufacture")
		require("telescope").load_extension("harpoon")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("file_browser")

		vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

		local dropdown = require("telescope.themes").get_dropdown()

		-- Keymaps
		-- vim.keymap.set("n", "<leader>f", function()
		-- 	require("telescope.builtin").find_files({
		-- 		find_command = { "rg", "--files", "--hidden", "--ignore", "-g", "!.git" },
		-- 	})
		-- end, { desc = "Find Files" })

		vim.keymap.set("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Search in files" })

		Keymapper("b", function()
			require("telescope.builtin").buffers(dropdown)
		end, "Search buffers")

		local fb = telescope.extensions.file_browser
		local picker = fb.file_browser

		Keymapper("sf", function()
			require("telescope.builtin").find_files({ cwd = "~/programs/trieve/frontends/analytics" })
		end, "Search analytics files")

		Keymapper("gf", function()
			require("telescope.builtin").git_status()
		end, "Search changed files")

		vim.keymap.set("v", "<leader>fs", function()
			-- Yank the selected text into register v
			vim.cmd('normal! "vy')
			-- Get the content of register v
			local selected_text = vim.fn.getreg("v")
			-- Clean up the text (remove newlines and extra spaces)
			selected_text = selected_text:gsub("\n", "")

			-- Create a new vertical split
			vim.cmd("vsplit")

			-- Use Telescope with ripgrep to search for the selected text in .tsx files
			require("telescope.builtin").grep_string({
				search = selected_text,
				glob_pattern = "*.tsx",
			})
		end, { noremap = true, silent = true })

		--
		-- vim.keymap.set("v", "<leader>fs", function()
		-- 	-- Yank the selected text into register v
		-- 	vim.cmd('normal! "vy')
		-- 	-- Get the content of register v
		-- 	local selected_text = vim.fn.getreg("v")
		-- 	-- Clean up the text (remove newlines and extra spaces)
		-- 	selected_text = selected_text:gsub("\n", "")
		--
		-- 	-- Create a new vertical split
		-- 	vim.cmd("vsplit")
		--
		-- 	-- Use Telescope with ripgrep to search for the selected text in .tsx files
		-- 	require("telescope.builtin").grep_string({
		-- 		search = selected_text,
		-- 		type_filter = "ts",
		-- 	})
		-- end, { noremap = true, silent = true })
	end,
}
