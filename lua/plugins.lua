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
        highlight = '',

        -- vim-surround mappings, they don't make much sense but I know them.
        -- add = 'ys',
        -- delete = 'ds',
        -- replace = 'cs',
        -- find = '',
        -- find_left = '',
    },
})

require('mini.jump2d').setup({
    view = {
        dim = true,
        n_steps_ahead = 2,
    },
    mappings = {
        start_jumping = '',
    },
    silent = true,
})

vim.keymap.set({"n", "v"}, "<Leader>f", function()
    MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
end)


local formatBlame = function(line_porcelain, _, idx)
    local hash = string.sub(line_porcelain.hash, 0, 7)
    local vals
    if hash ~= "0000000" then
        local date_text = tostring(os.date("%Y-%m-%d", line_porcelain.author_time))
        vals = {
            {
                textValue = hash,
                hl = hash,
            },
            {
                textValue = date_text,
                hl = "GruvboxAqua",
            },
            {
                textValue = line_porcelain.author,
                hl = "Normal",
            },
        }
    else
        vals = {
            { textValue = "0000000",          hl = "Comment" },
            { textValue = "",                 hl = "Comment" },
            { textValue = "Not yet commited", hl = "Comment" },
        }
    end
    return {
        idx = idx,
        values = vals,
        format = "%s %s %s",
    }
end

vim.pack.add({ "https://github.com/FabijanZulj/blame.nvim" })
require('blame').setup({
    commit_detail_view = "split",
    format_fn = formatBlame,
})

vim.keymap.set({ "n" }, "<Leader>g", ":BlameToggle<CR>")
