local ok, telescope = pcall(require, "telescope")
if not ok then
        vim.notify("找不到 telescope")
        return
end

local builtin = require('telescope.builtin')

telescope.setup({
        defaults = {
                file_ignore_patterns = { "node_modules" },
        },
        pickers = {
                find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
                },
        },
        extensions = {
                fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                },
                -- file_browser = {
                --         theme = "ivy",
                --         -- disables netrw and use telescope-file-browser in its place
                --         hijack_netrw = true,
                --         mappings = {
                --                 ["i"] = {
                --                         -- your custom insert mode mappings
                --                 },
                --                 ["n"] = {
                --                         -- your custom normal mode mappings
                --                 },
                --         },
                -- },
                -- projects = {
                --         patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
                --         show_hidden = false,
                -- }
        }
})
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension("fzf")
require('telescope').load_extension('projects')

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
-- require("telescope").load_extension("file_browser")
-- vim.keymap.set("n", "<leader>bb", ":Telescope file_browser <CR>", { noremap = true })

vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fw', builtin.live_grep, {})
-- 工作目录下搜索当前光标字符
vim.keymap.set('n', 'fc', builtin.grep_string, {})
vim.keymap.set('n', 'fh', builtin.oldfiles, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
-- vim.keymap.set('n', 'fh', builtin.help_tags, {})

