require("tokyonight").setup({
  transparent = true,
  style = 'moon',
  styles = {
    sidebars = "transparent",
    floats = "transparent"
  },
  on_highlights = function(hl, colors)
    hl.LineNr = {
      fg = colors.yellow
    }
    hl.CursorLineNr = {
      fg = colors.yellow
    }
  end
})

vim.cmd("colorscheme tokyonight")
