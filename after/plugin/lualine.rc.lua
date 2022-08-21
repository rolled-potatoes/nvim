local status, lualine = pcall(require, 'lualine')

if (not status) then
  print('lualine not installed')
  return;
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { {
      'filename',
      file_status = true,
      path = 1,
      symbols = {
        newfile = '',
        readonly = '',
        modified = '',
        unnamed = ''
      }
    } },
    lualine_c = { 'branch' },
    lualine_x = { {
      'diagnstics',
      sources = {
        'nvim_diagnostic'
      }
    } },
    lualine_y = {},
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true,
      path = 2
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
