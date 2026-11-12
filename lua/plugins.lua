-- FZF
vim.pack.add({{ src = "https://github.com/ibhagwan/fzf-lua" }})

local fzf = require('fzf-lua')
fzf.setup({
    winopts = {
        split = "belowright 10new",
        preview = { hidden = true },
    },
    keymap = {
        fzf = {
            ["ctrl-n"] = "down",
            ["ctrl-e"] = "up",
        },
    },
    buffers = {
        header = false,
        file_icons = false,
        ignore_current_buffer = true,
    },
})


local function findFiles()
    local is_git = vim.fs.root(0, ".git") ~= nil
    if is_git then
        fzf.git_files()
    else
        fzf.files()
    end
end

vim.keymap.set("n", "<Leader>b", ":FzfLua buffers<cr>", { silent = true })
vim.keymap.set("n", "<C-P>", findFiles, { silent = true })
