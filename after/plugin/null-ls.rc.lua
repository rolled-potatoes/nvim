local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

null_ls.setup({
  on_attach = function(client, bufnr)

    if client.server_capabilities.documentRangeFormattingProvider then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})
