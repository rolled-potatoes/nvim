local keymap = vim.keymap

if vim.g.vscode then
  keymap.set('n', 'ss', ':call VSCodeCall("workbench.action.splitEditor") <CR>');
  keymap.set('n', 'sv', ':call VSCodeCall("workbench.action.splitEditorOrthogonal") <CR>');

  keymap.set('', 'sh', ':call VSCodeCall("workbench.action.focusLeftGroup") <CR>')
  keymap.set('', 'sl', ':call VSCodeCall("workbench.action.focusRightGroup") <CR>')
  keymap.set('', 'sj', ':call VSCodeCall("workbench.action.focusBelowGroup") <CR>')
  keymap.set('', 'sk', ':call VSCodeCall("workbench.action.focusAboveGroup") <CR>')
else
  keymap.set('n', 'x', '"_x')

  -- Increment/decrement
  keymap.set('n', '+', '<C-a>')
  keymap.set('n', '-', '<C-x>')

  -- Delete a word backwards
  keymap.set('n', 'dw', 'vb"_d')

  -- Select all
  keymap.set('n', '<C-a>', 'gg<S-v>G')

  -- Save with root permission (not working for now)
  --vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

  -- New tab
  keymap.set('n', 'te', ':tabedit<Return>')
  -- Split window
  keymap.set('n', 'ss', ':split<Return><C-w>w')
  keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
  -- Move window
  keymap.set('n', '<Space>', '<C-w>w')
  keymap.set('', 'sh', '<C-w>h')
  keymap.set('', 'sk', '<C-w>k')
  keymap.set('', 'sj', '<C-w>j')
  keymap.set('', 'sl', '<C-w>l')

  -- Resize window
  keymap.set('n', '<C-w><left>', '<C-w><')
  keymap.set('n', '<C-w><right>', '<C-w>>')
  keymap.set('n', '<C-w><up>', '<C-w>+')
  keymap.set('n', '<C-w><down>', '<C-w>-')

  -- Prettier
  keymap.set('n', '<Leader>p', ':ALEFix<CR>')

  keymap.set('n','<Leader>w',':tabonly<CR>')
  require('custom')
end
