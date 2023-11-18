local status, neogen = pcall(require, 'neogen')

if(not status) then
  print('neogen not install')
  return
end

neogen.setup({

})

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("n", "<Leader>g", ":Neogen func <CR>", opts)
