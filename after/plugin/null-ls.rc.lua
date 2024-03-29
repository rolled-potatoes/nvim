local status, null_ls = pcall(require, 'null-ls')

if (not status) then return end

null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint, -- eslint or eslint_d
        null_ls.builtins.code_actions.eslint, -- eslint or eslint_d
        null_ls.builtins.formatting.prettier -- prettier, eslint, eslint_d, or prettierd
    },
  on_attach = function(client, bufnr)
  end,
})

null_ls.builtins.diagnostics.eslint.with({

diagnostics_format = "[eslint] #{m}\n(#{c})",

-- only enable eslint if root has .eslintrc.js

condition = function(utils)

return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else

end,

})
