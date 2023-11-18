local status, lspsaga = pcall(require, 'lspsaga')

if(not status) then 
    print('lspsaga not installed')
    return
end

lspsaga.setup({
    diagnostic = {
        keys = {
            quit = {'q', '<ESC>'}
        }
    },
})

-- shuttle = '[w' shuttle bettween the finder layout window
-- toggle_or_open = 'o' toggle expand or open
-- vsplit = 's' open in vsplit
-- split = 'i' open in split
-- tabe = 't' open in tabe
-- tabnew = 'r' open in new tab
-- quit = 'q' quit the finder, only works in layout left window
-- close = '<C-c>k' close finder
vim.keymap.set('n','<C-g>f',':Lspsaga finder def+ref <CR>')

vim.keymap.set('n','<C-g>h',':Lspsaga hover_doc <CR>')

vim.keymap.set('n', '[e', ':Lspsaga diagnostic_jump_next <CR>')
