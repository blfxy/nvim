local OK, nvim_tree = pcall(require, "nvim-tree")
if not OK then
        vim.notify("没有找到 nvim-tree")
        return
end
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
nvim_tree.setup({
        -- 完全禁止内置netrw
        disable_netrw = true,
        -- 是否显示 git 状态图标
        -- git = {
        --         enable = true,
        -- },
        -- root_dirs = { '.git' },
        -- project plugin 需要这样设置
        -- update_cwd = true,
        -- update_focused_file = {
        --     enable = true,
        --     update_cwd = true,
        -- },
        -- filters = {
        -- 隐藏 .文件
        -- dotfiles = true,
        -- 隐藏 node_modules 文件夹
        -- custom = { "node_modules" },
        -- },
        -- view = {
        -- 宽度
        --   width = 34,
        -- 也可以 'right'
        -- side = "left",
        -- 隐藏根目录
        -- hide_root_folder = false,
        -- 自定义列表中快捷键
        -- mappings = {
        --         -- 只用内置快捷键
        --         -- custom_only = true,
        --         -- list = list_keys,
        -- },
        -- 不显示行数
        -- number = false,
        -- relativenumber = false,
        -- 显示图标
        -- signcolumn = "yes",
        -- float = {
        --         enable = true
        -- }
        -- },
        -- actions = {
        --         open_file = {
        --                 -- 首次打开大小适配
        --                 resize_window = true,
        --                 -- 打开文件时关闭 tree
        --                 quit_on_open = false,
        --         },
        -- },
        -- wsl install -g wsl-open
        -- https://github.com/4U6U57/wsl-open/
        -- system_open = {
        -- mac
        -- cmd = "open",
        -- windows
        -- cmd = "wsl-open",
        -- },
})
map('n', '<leader>t', ':NvimTreeToggle <CR>', opt)
