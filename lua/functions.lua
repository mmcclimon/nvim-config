local function autoSaveWinView()
    if vim.w.savedBufView == nil then
        vim.w.savedBufView = {}
    end

    vim.w.savedBufView[vim.fn.bufnr("%")] = vim.fn.winsaveview()
end

local function autoRestoreWinView()
    local buf = vim.fn.bufnr("%")
    if vim.w.savedBufView ~= nil and vim.w.savedBufView[buf] ~= nil then
        local v = vim.fn.winsaveview()
        local atStartOfFile = v.lnum == 1 and v.col == 0
        if atStartOfFile then
            vim.fn.winrestview(vim.w.savedBufView[buf])
        end
        vim.w.savedBufView[buf] = nil
    end
end

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = autoSaveWinView,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = autoRestoreWinView,
})
