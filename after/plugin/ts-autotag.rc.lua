local status, autotag = pcall(require, 'nvim-ts-autotag')

if (not status) then
  print('autotag error')
  return;
end

autotag.setup {}
