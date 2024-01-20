function removeVisualSelection()
  local start_line = vim.fn.line("'<");
  local end_line = vim.fn.line("'>");
  local start_col = vim.fn.col("'<")
  local end_col = vim.fn.col("'>")

  for line = end_line, start_line, -1 do
     local line_text = vim.fn.getline(line)
     local new_text = line_text:sub(1, start_col - 1) .. line_text:sub(end_col + 1)
     vim.api.nvim_buf_set_lines(0, line - 1, line, false, {new_text})
  end

  vim.fn.visualmode();
  vim.fn.setpos("'<", {0, start_line, start_col, 0})
end

function insert_at_cursor(str)
    -- 현재 커서 위치 정보 가져오기
    local cursor_line = vim.fn.line(".")
    local cursor_col = vim.fn.col(".")
    
    -- 현재 커서 위치에 문자 삽입
    vim.api.nvim_buf_set_text(0, cursor_line - 1, cursor_col - 1, cursor_line - 1, cursor_col - 1, {str})

    -- 커서 이동 없이 삽입이 됐으므로, 커서를 원래 위치로 이동
    vim.fn.cursor(cursor_line, cursor_col + string.len(str))
end

function copyBlockToClipboard()
  local clipboard = vim.fn.getreg('+')

  removeVisualSelection();
  insert_at_cursor(clipboard)
  vim.fn.setreg('+', clipboard)
end

vim.keymap.set('v',"p",":lua copyBlockToClipboard()<CR>");

