local status, toggleterm = pcall(require, 'toggleterm')

if (not status) then
  print('toggle term error')
end

toggleterm.setup({
  shell = 'zsh',
  open_mapping = [[<Leader>t]],
})

vim.keymap.set("n", "2<C-\\>",":2ToggleTerm<CR>")
