vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })

require("gruvbox").setup({
    bold = false,
    italic = { ---@diagnostic disable-line
        strings = false,
    },
})

vim.cmd.colorscheme("gruvbox")
vim.opt.background = "dark"

vim.api.nvim_set_hl(0, "Todo", { fg = "#a08374", bg = "#582829" })

if vim.g.colors_name == "gruvbox" then
    vim.api.nvim_set_hl(0, "Search", { fg = "#444444", bg = "#00f0f0", reverse = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3e5e" })
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "String", { fg = "#b8ba54" })
    vim.api.nvim_set_hl(0, "Statement", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Repeat", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Conditional", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#889c94" })
    vim.api.nvim_set_hl(0, "GruvboxGreen", { fg = "#b8ba54" })

    -- go overrides
    vim.api.nvim_set_hl(0, "@lsp.type.function.go", { link = "GruvboxFg2" })
    vim.api.nvim_set_hl(0, "@lsp.type.method.go", { link = "GruvboxFg2" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.go", { link = "GruvboxOrange" })
    vim.api.nvim_set_hl(0, "@lsp.type.operator.go", { link = "Normal" })
    vim.api.nvim_set_hl(0, "@lsp.type.type.go", { fg = "#92ba95" })     -- aqua-ish
    vim.api.nvim_set_hl(0, "@lsp.type.property.go", { fg = "#c2c2ab" }) -- very faint blue

    -- cue
    vim.api.nvim_set_hl(0, "@variable.cue", { link = "GruvboxBlue" })
end
