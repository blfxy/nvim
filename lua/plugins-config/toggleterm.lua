local OK, toggleterm = pcall(require, 'toggleterm')
if not OK then
        print('not found toggleterm')
        return
end
toggleterm.setup {
        direction = 'horizontal', -- 'vertical' | 'horizontal' | 'tab' | 'float',
        start_in_insert = false, -- 进入终端时是否为插入模式
        -- shading_factor = 3,
        -- open_mapping 打开关闭终端 前缀可以到数字表示打开/关闭某个终端
        open_mapping = [[<F2>]],
        -- float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        -- border = 'double' -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
        -- width = <value>,
        -- height = <value>,
        -- winblend = 3,
        -- },
}
-- vim.keymap.set('n', '<C-t>', ':ToggleTerm <CR>', {})
-- vim.keymap.set('t', '<C-t>', ':ToggleTerm <CR>', {})
