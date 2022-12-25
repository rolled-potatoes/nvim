local status, ls = pcall(require, 'luasnip')

if (not status) then
  print('luasnip not found')
  return
end
