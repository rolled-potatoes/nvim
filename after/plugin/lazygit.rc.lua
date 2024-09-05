local status, lazygit = pcall(require, 'lazygit')

if(not status) then 
  print('lazygit not require')
  return
end

