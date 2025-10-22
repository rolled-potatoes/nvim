-- fuzzy finder: 파일 탐색기
-- https://github.com/nvim-telescope/telescope.nvim
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    on_attach = function()
      print('telescope attach')
    end,
    config = function()
      local telescope = require('telescope')
      telescope.setup {}

      local builtin = require('telescope.builtin')
      vim.keymap.set(
        'n', ';f', 
        function () 
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end, 
        { desc = 'Telescope find files' })
    end,
}
