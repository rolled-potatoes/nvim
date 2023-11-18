local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  index = {
    enable = true,
  },
  ensure_installed = {
    'tsx',
    'lua',
    'css',
    'html',
    'javascript',
    'json',
    'markdown',
    'scss',
    'markdown_inline'
  },
  autotag = {
    enable = true,
  }
}
