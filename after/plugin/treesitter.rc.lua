local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

ts.setup {
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {},
  },
  indent = {
    enable = true,
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
    'markdown_inline'
  }
}

