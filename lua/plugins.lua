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
        prompt = "Buf>",
        header = false,
        file_icons = false,
        ignore_current_buffer = true,
    },
    fzf_colors = {
        ["fg"]      = {'fg', {'GruvboxFg3', 'Normal'}},
        ["fg+"]     = {'fg', {'CursorLine', 'CursorColumn', 'Normal'}},
        ["prompt"]  = {'fg', {'Comment'}},
        ["pointer"] = {'fg', {'Normal', 'Exception'}},
    },
    hls = {
        path_linenr = "LineNr",
        buf_flag_alt = "GruvboxOrange",
        buf_nr = "Statement",
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

-- vim-surround
vim.pack.add({{ src = "https://github.com/kylechui/nvim-surround" }})
require("nvim-surround").setup({
    highlight = { duration = 250 },
})

-- lualine (aka airline)
vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })
require('lualine').setup({
    options = {
        theme = custom_gruvbox,
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_b = {{"branch", icon = '⎇'}},
        lualine_x = {
            {'fileformat', icons_enabled = false },
        },
        lualine_y = {
            { 'lsp_status', icons_enabled = false },
        },
        lualine_z = { "%3p%% (%v,%l)" },
    }
})
