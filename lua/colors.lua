vim.pack.add({ "https://github.com/ellisonleao/gruvbox.nvim" })

require("gruvbox").setup({
    bold = false,
    italic = {
        strings = false,
    },
})

vim.cmd.colorscheme("gruvbox")
vim.opt.background = "dark"

if vim.g.colors_name == "gruvbox" then
    vim.api.nvim_set_hl(0, "Search", { fg = "#444444", bg = "#00f0f0", reverse = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#3e3e5e" })
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#ebdbb2" })
    vim.api.nvim_set_hl(0, "String", { fg = "#b8ba54" })
    vim.api.nvim_set_hl(0, "Statement", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Repeat", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Conditional", { link = "GruvboxPurple" })
    vim.api.nvim_set_hl(0, "Identifier", { fg = "#889c94" })
end
