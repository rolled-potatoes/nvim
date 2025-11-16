-- Lua의 함수 선언 (Neovim이 설정을 로드할 때 실행됩니다)
local function setup_toggleterm_cycle()
    local toggleterm = require('toggleterm')
    local ui = require("toggleterm.ui")

    -- 터미널이 켜져있으면 세션을 스왑할 수 있도록한다.
    local function toggle_or_swap ()
      local has_open = ui.find_open_windows()

      if has_open then
        vim.api.nvim_command("TermSelect");
      else
        vim.api.nvim_command("ToggleTerm");
      end
    end

    -- 터미널이 켜져있으면 닫는다.
    local function close_hard()
      local has_open, windows = ui.find_open_windows()
      if has_open then
        ui.close_and_save_terminal_view(windows)
      end
    end

    -- 새로운 터미널 열기
    function create_term()
        local Terminal = require('toggleterm.terminal').Terminal
        local new_term = Terminal:new()
        new_term:toggle()
    end

    vim.keymap.set('n', '<leader>tt', toggle_or_swap )
    vim.keymap.set('n', '<leader>tc',  close_hard )
    vim.keymap.set('n', '<leader>tn',  create_term )

    toggleterm.setup({
        -- 모든 터미널의 기본 방향을 floating으로 설정
        direction = 'float', 
        -- Floating 터미널의 시각적 옵션
        float_opts = {
            border = 'curved', 
            title_pos = 'center',
        },
    })
end

return {
  'akinsho/toggleterm.nvim', 
  config = setup_toggleterm_cycle 
}
