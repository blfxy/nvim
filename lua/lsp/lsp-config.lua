require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"tsserver",
		"volar",
		"cssls",
		"html",
		"jsonls",
		"marksman",
		"taplo", -- toml支持
		"eslint",
	},
})

local global_lsp_config = function(custom_config)
	return {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		-- flags = {
		-- 	debounce_text_changes = 150,
		-- },
		on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			-- vim.keymap.set("n", "<space>f", function()
			-- 	vim.lsp.buf.format({ async = true })
			-- end, bufopts)
		end,
		custom_config,
	}
end

local lspconfig = require("lspconfig")

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
	sumneko_lua = require("lsp.lang-config.lua"),
	rust_analyzer = require("lsp.lang-config.rust"),
	marksman = require("lsp.lang-config.markdown"),
	tsserver = require("lsp.lang-config.ts"),
	volar = require("lsp.lang-config.vue"),
	html = require("lsp.lang-config.html"),
	cssls = require("lsp.lang-config.css"),
	jsonls = require("lsp.lang-config.json"),
	taplo = require("lsp.lang-config.taplo"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		-- 自定义初始化配置文件必须实现on_setup 方法
		config.on_setup(lspconfig[name], global_lsp_config)
	else
		-- 使用默认参数
		lspconfig[name].setup(global_lsp_config())
	end
end
