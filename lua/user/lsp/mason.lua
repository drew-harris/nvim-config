local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	automatic_installation = false,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

require("mason-lspconfig").setup_handlers({
	function(server)
		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
			commands = {
				OrganizeImports = {
					organize_imports,
					description = "Organize Imports",
				},
			},
			settings = nil,
		}

		---@diagnostic disable-next-line: missing-parameter  From initial commit
		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		if server == "sumneko_lua" then
			require("neodev").setup({
				-- Options for neodev
			})
		end

		if server == "denols" then
			opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
		end

		if server == "tsserver" then
			opts.root_dir = lspconfig.util.root_pattern("package.json")
		end

		if server == "tailwindcss" then
			opts.settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							"cva\\(([^)]*)\\)",
							"[\"'`]([^\"'`]*).*?[\"'`]",
						},
					},
				},
			}
			print(opts)
		end

		lspconfig[server].setup(opts)
	end,
})
