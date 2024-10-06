return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"lopi-py/luau-lsp.nvim",
		config = function()
			require("luau-lsp").setup({
				platform = {
					type = "roblox",
				},
				types = {
					roblox_security_level = "PluginSecurity",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "luau_lsp" },
			})

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				["luau_lsp"] = function()
					require("luau-lsp").setup({
						platform = {
							type = "roblox",
						},
						types = {
							roblox_security_level = "PluginSecurity",
						},
					})
				end,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
