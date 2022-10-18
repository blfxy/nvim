local OK, toggleterm = pcall(require, 'toggleterm')
if not OK then
        print('not found toggleterm')
        return
end
toggleterm.setup {
        direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
        shading_factor = 3,
        open_mapping = [[<C-t>]],
        float_opts = {
                -- The border key is *almost* the same as 'nvim_open_win'
                -- see :h nvim_open_win for details on borders however
                -- the 'curved' border is a custom border type
                -- not natively supported but implemented in this plugin.
                border = 'double' -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
                -- like `size`, width and height can be a number or function which is passed the current terminal
                -- width = <value>,
                -- height = <value>,
                -- winblend = 3,
        },
}
-- vim.keymap.set('n', '<C-t>', '<Cmd>exe v:count1 . "toggleterm"<CR>', {})
vim.keymap.set('n', '<C-t>', ':ToggleTerm <CR>', {})
vim.keymap.set('i', '<C-t>', ':ToggleTerm <CR>', {})
