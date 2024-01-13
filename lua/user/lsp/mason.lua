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

vim.filetype.add({
	extension = {
		pest = "pest",
	},
})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

require("lspconfig.configs").pest = {
	default_config = {
		cmd = { "pest-language-server" },
		name = "pest",
		filetypes = { "pest" },
		root_dir = lspconfig.util.root_pattern("Cargo.toml"),
		settings = {},
	},
}

-- Setup pest

lspconfig.pest.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
})

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
			settings = {},
		}

		---@diagnostic disable-next-line: missing-parameter  From initial commit
		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end

		if server == "denols" then
			opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
		end

		if server == "jdtls" then
			opts.root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git")

			-- opts.settings.java.project.source_paths = {
			-- 	"/Users/drew/programs/minecraft/libraries/api/target/generated-sources/apollo/service/",
			-- 	"/Users/drew/programs/minecraft/libraries/api/target/generated-sources/apollo/",
			-- 	"/Users/drew/programs/minecraft/libraries/api/target/generated-sources",
			-- }
		end

		if server == "tsserver" then
			opts.root_dir = lspconfig.util.root_pattern("package.json")
			-- Setup eslint_d
		end

		if server == "clangd" then
			-- Add clang-tidy
			opts.resolved_capabilities = {
				execute_command = true,
			}

			opts.cmd = {
				"clangd",
				"--clang-tidy",
				"--compile_args_from=filesystem",
				"-j=4", -- number of workers
			}
		end

		if server == "tailwindcss" then
			-- Templ support
			opts.filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"ts",
				"tsx",
				"templ",
			}
			opts.settings = {

				-- "tailwindCSS.experimental.classRegex": [
				--   // enables tailwind autocomplete for specified functions
				--   ["cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"],
				--   ["cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"],
				--   ["cx\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]"]
				-- ],

				tailwindCSS = {
					-- classAttributes = { "class", "className", "variants.*" },
					-- experimental = {
					-- 	classRegex = {
					-- 		"cva\\(([^)]*)\\)",
					-- 		"[\"'`]([^\"'`]*).*?[\"'`]",
					-- 	},
					-- },
				},
			}
			opts.init_options = {
				userLanguages = {
					templ = "html",
				},
			}
		end

		lspconfig[server].setup(opts)
	end,
})

-- Add custom pest language server to lspconfig
