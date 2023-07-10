local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

ts.setup {
   auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
  index = {
    enable = true,
    disable = true
  },
  ensure_installed = {
    'tsx',
    'lua',
    'css',
    'html',
    'javascript',
    'typescript',
    'html',
    'json',
    'markdown',
    'scss',
  },
  autotag = {
    enable = true
  },
  indent = {
    enable = true
  }
}
