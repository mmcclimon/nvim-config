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

local bufGroup = vim.api.nvim_create_augroup('winsave', { clear = true })
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    group = bufGroup,
    callback = autoSaveWinView,
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    group = bufGroup,
    callback = autoRestoreWinView,
})

local function closeFloats()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

vim.keymap.set("n", "<Esc>", closeFloats)

-- stolen from vim-unimpaired, to find git conflict markers
local function findMarker(reverse)
    flag = "W"
    if reverse then
        flag = "bW"
    end
    vim.fn.search([[^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)]], flag)
end

vim.keymap.set("n", "]n", function() findMarker(false) end)
vim.keymap.set("n", "[n", function() findMarker(true) end)
