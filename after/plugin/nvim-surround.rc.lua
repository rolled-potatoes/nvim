local status, surround = pcall(require, 'nvim-surround')

if (not status) then
  print('not')
  return
end

surround.setup({

})
