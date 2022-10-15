-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  leader键
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
-- 插入模式下光标移动
map('i', '<C-h>', '<Left>', opt)
map('i', '<C-j>', '<Down>', opt)
map('i', '<C-k>', '<Up>', opt)
map('i', '<C-l>', '<Right>', opt)
-- 保存映射
map('i', '<C-s>', '<ESC>:w <CR>', opt)
map('n', '<C-s>', '<ESC>:w <CR>', opt)

-- 切换分屏
map('n', '<A-h>', '<C-w>h', opt)
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)

-- 命令行下 Ctrl+j/k  上一个/下一个选项
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })

-- vim.g.python3_host_prog = '/usr/bin/python3'

-- vim.api.nvim_set_keymap('n', '<c-P>',
--     "<cmd>lua require('fzf-lua').files()<CR>",
--     { noremap = true, silent = true })
