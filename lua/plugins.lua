-- FZF
vim.pack.add({ { src = "https://github.com/ibhagwan/fzf-lua" } })

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
    files = {
        cwd_prompt = true,
    },
    git = {
        files = {
            cwd_header = false,
        },
    },
    fzf_colors = {
        ["fg"]      = { 'fg', { 'GruvboxFg3', 'Normal' } }, ---@diagnostic disable-line
        ["fg+"]     = { 'fg', { 'CursorLine', 'CursorColumn', 'Normal' } }, ---@diagnostic disable-line
        ["prompt"]  = { 'fg', { 'Comment' } }, ---@diagnostic disable-line
        ["pointer"] = { 'fg', { 'Normal', 'Exception' } }, ---@diagnostic disable-line
    },
    hls = { ---@diagnostic disable-line
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

-- lualine (aka airline)
vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })
require('lualine').setup({
    options = {
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_b = { { "branch", icon = '⎇' } },
        lualine_c = { {
            'filename',
            path = 1, -- relative
            newfile_status = true,
        } },
        lualine_x = {
            { 'fileformat', icons_enabled = false },
        },
        lualine_y = {
            { 'lsp_status', icons_enabled = false },
        },
        lualine_z = { "%3p%% (%v,%l)" },
    }
})

-- mini (lots of stuff, including argwrap + trailing space)
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

require('mini.trailspace').setup()
vim.keymap.set("n", "<Leader>w", MiniTrailspace.trim, { silent = true })

local sj = require('mini.splitjoin')
sj.setup({
    mappings = {
        toggle = '<Leader>a',
    },
    split = {
        hooks_post = {
            sj.gen_hook.add_trailing_separator(),
        },
    },
    join = {
        hooks_post = {
            sj.gen_hook.del_trailing_separator(),
        }
    },
})

require('mini.surround').setup({
    mappings = {
        -- vim-surround mappings, they don't make much sense I know them.
        add = 'ys',
        delete = 'ds',
        replace = 'cs',

        -- disable these because they eat the global 's' mapping
        highlight = '',

        -- these two find commands are plausibly useful but I need to find
        -- better mappings for them
        find = '',
        find_left = '',
    },
})
