local status, nerdTree = pcall(require, 'nvim-tree')
if(not status) then return end

local libAPI = require('nvim-tree.api')
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'sv',    api.node.open.vertical,                  opts('Help'))
  vim.keymap.set('n', 'ss',    api.node.open.horizontal,                  opts('Help'))
  vim.keymap.set('n', 's',    function() end,                  opts('Help'))
end

nerdTree.setup({
  on_attach = my_on_attach,
   sort = {
        sorter = "name",
        folders_first = true,
        files_first = false,
      },
  renderer = {
   group_empty = true,
 },
 filters = {
   dotfiles = false,
 },
  git = {
    ignore = false,
  }
})


vim.keymap.set('n','<C-n>t',function()
  libAPI.tree.toggle()
end)

vim.keymap.set('n','<C-n>f',':NvimTreeFindFile <CR>')
vim.keymap.set('n','tu',':NvimTreeResize 100 <CR>')
vim.keymap.set('n','td',':NvimTreeResize 50 <CR>')
