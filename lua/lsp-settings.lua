vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- keybindings
vim.keymap.set({"n"}, "<LocalLeader>r", vim.lsp.buf.references)
vim.keymap.set({"n"}, "<LocalLeader>d", vim.lsp.buf.hover)

-- misc. settings
vim.diagnostic.config({
    -- I don't love this, but I like it more than the floating window.
    virtual_text = {
        current_line = true
    },
})

-- language-specifics
vim.lsp.enable('gopls')
