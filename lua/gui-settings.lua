local function copy()
    vim.cmd([[normal! "+y]])
end

local paste = function ()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end

local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

if vim.g.neovide then
    -- fix cmd-c / cmd-v
    vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
    vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })

    -- fix cmd-plus / cmd-minus
    vim.keymap.set("n", "<D-=>", function() change_scale_factor(1.1) end)
    vim.keymap.set("n", "<D-->", function() change_scale_factor(1/1.1) end)

    -- man these things are terrible
    vim.g.neovide_scroll_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0
end

vim.o.guifont = "Berkeley Mono:h11"
