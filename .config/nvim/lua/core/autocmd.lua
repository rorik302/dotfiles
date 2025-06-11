local autocmd = vim.api.nvim_create_autocmd

local function augroup(name, clear)
  local clear_opt = clear or true
  return vim.api.nvim_create_augroup("User_" .. name, { clear = clear_opt })
end

autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = augroup("HighlightYank"),
  callback = function()
    vim.highlight.on_yank()
  end
})

autocmd("BufReadPost", {
  desc = "Restore cursor location on opened buffer",
  group = augroup("LastLocation"),
  callback = function(event)
    local exclude = { "gitcommit", "commit", "gitrebase" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end

    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end
})

autocmd("LspAttach", {
  desc = "Highlight words based on cursor hover",
  group = augroup("LspAttach"),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_group = augroup("LspHighlight", false)
      autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = function()
          vim.lsp.buf.document_highlight()
        end
      })

      autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_group,
        callback = function()
          vim.lsp.buf.clear_references()
        end
      })

      autocmd("LspDetach", {
        group = augroup("LspDetach", false),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = highlight_group, buffer = event2.buf })
        end
      })
    end
  end
})
