local status, comment = pcall(require, 'Comment')
if(not status)then
  print('comment not install')
  return 
end

comment.setup({})
