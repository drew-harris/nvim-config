local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		["<tab>"] = "TAB",
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["1"] = "which_key_ignore",
	["2"] = "which_key_ignore",
	["3"] = "which_key_ignore",
	["4"] = "which_key_ignore",
	["5"] = "which_key_ignore",
	["6"] = "which_key_ignore",
	["7"] = "which_key_ignore",
	["8"] = "which_key_ignore",
	["9"] = "which_key_ignore",
	["x"] = { "<cmd>bw<CR>", "Close Buffer" },
	["z"] = { "<cmd>set hlsearch!<CR>", "No Highlight" },
	["p"] = { "<cmd>b#<cr>", "Previous Buffer" },

	-- TODO: Migrate to auto-which-key
	h = {
		name = "Harpoon",
		["1"] = "which_key_ignore",
		["2"] = "which_key_ignore",
		["3"] = "which_key_ignore",
		["4"] = "which_key_ignore",
		["5"] = "which_key_ignore",
		["6"] = "which_key_ignore",
		["7"] = "which_key_ignore",
		["8"] = "which_key_ignore",
		["9"] = "which_key_ignore",
	},
	q = {
		name = "Quickfix",
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		c = { "<cmd>GitConflictListQf<cr>", "Merge Conflicts" },
	},
	-- TODO: Migrate gitsigns
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			name = "Diff",
			o = { "<cmd>DiffviewOpen<cr>", "Open Diff View" },
			c = { "<cmd>DiffviewClose<cr>", "CLOSE" },
			p = { "<cmd>DiffviewOpen origin/main...HEAD<cr>", "PR Against Main" },
			h = { "<cmd>DiffviewOpen HEAD~1<cr>", "HEAD~1" },
			f = { "<cmd>DiffviewFileHistory<cr>", "File History" },
		},
		D = {
			"<cmd>Gitsigns preview_hunk_inline<cr>",
			"Inline Diff",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
		d = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			"Document Diagnostics",
		},
		i = { "<cmd>LspInfo<cr>", "Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = {
			function()
				require("trouble").toggle("quickfix")
			end,
			"Quickfix",
		},
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		m = { "<cmd>TSToolsAddMissingImports<CR>", "Add Missing Import" },
		p = { "<cmd>lua vim.diagnostic.open_float({focusable = true})<cr>", "View Issues" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		t = { "<cmd>TodoTelescope<cr>", "Todos" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	-- HACK: MIGRATE
	["S"] = {
		name = "Snippets",
		e = {
			function()
				require("scissors").editSnippet()
			end,
			"edit snippets",
		},
		a = {
			function()
				require("scissors").addNewSnippet()
			end,
			"addSnippet snippets",
		},
	},
	-- TODO: MIGRATE
	m = {
		name = "More...",
		c = { "<cmd>CellularAutomaton make_it_rain<cr>", "CA" },
		n = { "<cmd>Flote<cr>", "Notes" },
		s = { "<cmd>cd clients/trieve-shopify-extension<cr>", "Shopify" },
	},

	k = {
		name = "Kwik files!!!",
		e = { "<cmd>e .env<cr>", "Open env file" },
		a = { "<cmd>e .air.toml<cr>", "Open air config" },
		i = { "<cmd>e .gitignore<cr>", "Open gitignore" },
		p = { "<cmd>e package.json<cr>", "Open package.json" },
		t = { "<cmd>e cargo.toml<cr>", "Open Cargo toml" },
		l = { "<cmd>e .eslintrc.cjs<cr>", "Open Eslintrc" },
		r = { "<cmd>e README.md<cr>", "Open README.md" },
		d = { "<cmd>e .dockerignore<cr>", "Open dockerignore" },
		j = { "<cmd>e .justfile<cr>", "Open justfile" },
		n = { "<cmd>e pad.nu<cr>", "Open pad" },
		s = { "<cmd>e website/.env<cr>", "Open Website env" },
		w = { "<cmd>e worker/.env<cr>", "Open Worker env" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)

local visual_mappings = {
	["S"] = {
		name = "Snippets",
		e = {
			function()
				require("scissors").editSnippet()
			end,
			"edit snippets",
		},
		a = {
			function()
				require("scissors").addNewSnippet()
			end,
			"addSnippet snippets",
		},
	},
}

which_key.register(visual_mappings, {
	mode = "v", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
})
