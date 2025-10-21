local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end

-- keymap
-- 토글 
vim.keymap.set('n','<C-n>t',':NvimTreeToggle <CR>')
-- 현재 열린 파일로 트리 검색
vim.keymap.set('n','<C-n>f',':NvimTreeFindFile <CR>')
--

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  on_attach = on_attach,
  config = function()
 	require("nvim-tree").setup {
		git = {
			ignore = true
		}
	}
  end,
}
