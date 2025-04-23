return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	build = "make",
	opts = {
		-- add any opts here
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20240620",
			temperature = 0,
			max_tokens = 4096,
		},
		provider = "openrouter",
		-- cursor_applying_provider = "groq", -- In this example, use Groq for applying, but you can also use any provider you want.
		behaviour = {
			--- ... existing behaviours
			enable_cursor_planning_mode = false, -- enable cursor planning mode!
			enable_claude_text_editor_tool_mode = false,
		},
		vendors = {
			groq = { -- define groq provider
				__inherited_from = "openai",
				api_key_name = "GROQ_API_KEY",
				endpoint = "https://api.groq.com/openai/v1/",
				model = "llama-3.3-70b-versatile",
				max_completion_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
				disable_tools = true, -- Open-source models often do not support tools.
			},
			openrouter = {
				__inherited_from = "openai",
				endpoint = "https://openrouter.ai/api/v1",
				api_key_name = "OPENROUTER_API_KEY",
				model = "google/gemini-2.0-flash-001",
				-- disable_tools = true, -- Open-source models often do not support tools.
			},
		},
	},
	-- behaviour = {
	-- 	auto_suggestions = true, -- Experimental stage
	-- 	auto_set_highlight_group = true,
	-- 	auto_set_keymaps = true,
	-- 	auto_apply_diff_after_generation = false,
	-- 	support_paste_from_clipboard = false,
	-- 	minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
	-- 	enable_token_counting = true, -- Whether to enable token counting. Default to true.
	-- 	enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
	-- },
	-- hints = { enabled = false },
	keys = {
		{
			"<leader>aa",
			function()
				require("avante.api").ask()
			end,
			desc = "avante: ask",
			mode = { "n", "v" },
		},
		{
			"<leader>ar",
			function()
				require("avante.api").refresh()
			end,
			desc = "avante: refresh",
		},
		{
			"<leader>ae",
			function()
				require("avante.api").edit()
			end,
			desc = "avante: edit",
			mode = "v",
		},
	},
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"zbirenbaum/copilot.lua", -- for providers='copilot'
		-- {
		-- 	-- support for image pasting
		-- 	"HakonHarnes/img-clip.nvim",
		-- 	event = "VeryLazy",
		-- 	opts = {
		-- 		-- recommended settings
		-- 		default = {
		-- 			embed_image_as_base64 = false,
		-- 			prompt_for_file_name = false,
		-- 			drag_and_drop = {
		-- 				insert_mode = true,
		-- 			},
		-- 			-- required for Windows users
		-- 			use_absolute_path = true,
		-- 		},
		-- 	},
		-- },
		{
			-- Make sure to setup it properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
