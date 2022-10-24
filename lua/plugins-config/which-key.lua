local OK, which_key = pcall(require, "which-key")
if not OK then
    print("找不到 which-key")
    return
end
vim.g.timeoutlen = 0
which_key.register(mappings, opts)

-- which_key.setup({})