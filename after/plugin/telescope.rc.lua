local status, telescope = pcall(require, 'telescope')

if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension('file_browser')

local opts = {
  noremap = true,
  silent = true
}

vim.keymap.set('n', ';f', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
    previewer = false,
    layout_config = {
      width = 0.4,
      height = 0.4,
      prompt_position = "top"
    }
  })
end
  , opts)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end, opts)
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end, opts)
vim.keymap.set('n', ';t', function()
  builtin.help_tags()
end, opts)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end, opts)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
end)
vim.keymap.set('n', ';s', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignnore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 0.4 }
  })
end)
