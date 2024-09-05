vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

vim.cmd [[colorscheme tokyonight]]

vim.api.nvim_set_hl(0, 'LineNr', { fg = "black" , bg = 'white'})
vim.api.nvim_set_hl(0,'CursorLineNr', {fg = 'white'})
