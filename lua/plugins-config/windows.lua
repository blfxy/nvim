local OK, windows = pcall(require, 'windows')
if not OK then
        print('not found windows')
        return
end

vim.o.winwidth = 30
vim.o.winminwidth = 30
vim.o.equalalways = false

windows.setup()
local function cmd(command)
        return table.concat({ '<Cmd>', command, '<CR>' })
end

-- 最大化/最小化当前窗口
vim.keymap.set('n', 'wm', cmd 'WindowsMaximize')
-- 最大化/最小化当前窗口宽度
vim.keymap.set('n', 'ww', cmd 'WindowsMaximizeVertically')
-- 最大化/最小化当前窗口高宽度
vim.keymap.set('n', 'wh', cmd 'WindowsMaximizeHorizontally')
vim.keymap.set('n', 'w=', cmd 'WindowsEqualize')

