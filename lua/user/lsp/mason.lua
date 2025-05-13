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

vim.filetype.add({
	extension = {
		astro = "astro",
	},
})

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

lspconfig.gleam.setup({})

lspconfig.rust_analyzer.setup({
	on_attach = require("user.lsp.handlers").on_attach,
})

lspconfig.nushell.setup({})

require("mason-lspconfig").setup_handlers({
	function(server)
		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
			settings = {},
		}

		---@diagnostic disable-next-line: missing-parameter  From initial commit
		server = vim.split(server, "@")[1]

		local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", conf_opts, opts)
		end

		if server == "denols" then
			opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
		end

		if server == "jdtls" then
			opts.root_dir = lspconfig.util.root_pattern("pom.xml", "gradle.build", ".git")

		end

		if server == "tsserver" then
			opts.root_dir = lspconfig.util.root_pattern("package.json")
			opts.init_options = {
				preferences = {
					importModuleSpecifierPreference = "non-relative",
				},
			}
		end

		-- if server == "eslint" then
		-- 	opts.settings.options = {
		-- 		overrideConfig = {
		-- 			parserOptions = {
		-- 				project = { "./tsconfig.json" },
		-- 			},
		-- 		},
		-- 	}
		-- end

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

		if server == "gopls" then
			opts.settings = {
				gopls = {
					hints = {
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						constantValues = true,
						functionTypeParameters = true,
						parameterNames = true,
						rangeVariableTypes = true,
					},
				},
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
				"astro",
			}

			opts.settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
							{ "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
						},
					},
				},
			}

			opts.init_options = {
				userLanguages = {
					templ = "html",
				},
			}
		end

		if server == "htmx" then
			opts.filetypes = {
				"html",
				"css",
				"templ",
			}
		end

		if server == "html" then
			opts.filetypes = {
				"html",
				"css",
				-- "scss",
				-- "javascript",
				-- "javascriptreact",
				-- "typescript",
				-- "typescriptreact",
				-- "ts",
				-- "tsx",
				"templ",
			}
			-- Disable formatting
			opts.settings = {
				html = {
					format = {
						enable = false,
					},
				},
			}
		end

		lspconfig[server].setup(opts)
	end,
})

-- vim.keymap.set("n", "<leader>lo", function()
-- 	local bufnr = vim.api.nvim_get_current_buf()
-- 	local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
-- 	for _, client in ipairs(clients) do
-- 		if client.name == "typescript-tools" then
-- 			require("typescript-tools.api").organize_imports()
-- 			return
-- 		end
-- 	end
-- 	vim.notify("TypeScript Tools not found", vim.log.levels.WARN)
-- end, { desc = "Organize Imports" })

require("lspconfig").astro.setup({})
