require("mason").setup()
-- 自动安装语言服务列表
local servers = { "rust_analyzer", "sumneko_lua", "volar", "vuels", "html", "cssls", "jsonls", "tsserver", "taplo", "marksman"}
require("mason-lspconfig").setup({
        ensure_installed = servers
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

---
-- Diagnostic customization
---
local sign = function(opts)
        -- See :help sign_define()
        vim.fn.sign_define(opts.name, {
                texthl = opts.name,
                text = opts.text,
                numhl = ''
        })
end

sign({ name = 'DiagnosticSignError', text = ' ' })
sign({ name = 'DiagnosticSignWarn', text = ' ' })
sign({ name = 'DiagnosticSignHint', text = ' ' })
sign({ name = 'DiagnosticSignInfo', text = ' ' })

-- See :help vim.diagnostic.config()
vim.diagnostic.config({
        --显示虚拟诊断信息
        -- virtual_text = false,
        virtual_text = {
                -- source = 'always',
                prefix = '',
                -- Only show virtual text matching the given severity(仅显示与给定严重性匹配的虚拟文本)
                severity = {
                        -- Specify a range of severities
                        min = vim.diagnostic.severity.ERROR,
                },
        },
        severity_sort = true, --诊断信息严重性排序
        -- 在带有诊断信息的行旁边显示一个标志
        signs = true,
        update_in_insert = true, --在插入模式下编辑时更新诊断
        underline = true, --使用下划线显示诊断位置
        -- 在浮动窗口中显示诊断消息
        float = {
                -- focusable = true,
                -- style = "minimal",
                border = 'rounded',
                -- 显示诊断信息来源
                source = 'always',
                -- header = '',
                -- prefix = '',
        },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'rounded' }
)
-- require("lsp.lspconfig")

-- require("lsp.lang-config.rust")
-- require("lsp.lang-config.tsserver")
-- require("lsp.lang-config.html")

local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        -- Mappings.
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
        vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, bufopts)
        vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, bufopts)
        vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, bufopts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        -- vim.keymap.set('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, bufopts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
        }
end
