-- text editing
vim.opt.smartindent = true -- indent braces automatically
vim.opt.cinwords = ""      -- turn off weird magic indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 78

-- UI
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.scrolloff = 3
vim.opt.modelines = 2
vim.opt.wildmode = "longest:full,longest"
vim.opt.wildignore:append({ ".git", "local", "build", "vendor" })
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<" }
vim.opt.winborder = "single"

vim.opt.foldlevelstart = 99
vim.opt.foldopen:remove({ "block" })

vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath('state') .. '/backup'

-- mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.keymap.set({ "n" }, "<Leader>s", '<cmd>:nohlsearch<cr>')

-- swap colon + semicolon
vim.keymap.set({ "n", "v", "o" }, ";", ":")
vim.keymap.set({ "n", "v", "o" }, ":", ";")
vim.keymap.set({ "n", "v", "o" }, "<Space>", ":")

-- better window motion
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- colemak stuff
-- modal swapping
vim.keymap.set({ "n", "v", "o" }, "u", "i")
vim.keymap.set({ "n", "v" }, "U", "I")

-- hjkl = hnei
vim.keymap.set({ "n", "v" }, "h", "h")
vim.keymap.set({ "n", "v" }, "n", "j")
vim.keymap.set({ "n", "v" }, "e", "k")
vim.keymap.set({ "n", "v" }, "i", "l")
vim.keymap.set({ "n", "v" }, "H", "H")
vim.keymap.set({ "n", "v" }, "N", "J")
vim.keymap.set({ "n", "v" }, "E", "K")
vim.keymap.set({ "n", "v" }, "I", "L")

-- stuff stolen by the above
vim.keymap.set({ "n", "v" }, "k", "n")
vim.keymap.set({ "n", "v" }, "K", "N")
vim.keymap.set({ "n", "v" }, "l", "u")
vim.keymap.set({ "n", "v" }, "L", "U")
vim.keymap.set({ "n", "v" }, "j", "e")
vim.keymap.set({ "n", "v" }, "J", "E")

vim.keymap.set({ "n" }, "<BS>", "<C-^>")

-- vim-rsi mappings
vim.keymap.set({ "i" }, "<C-A>", "<C-O>^")
vim.keymap.set({ "c" }, "<C-A>", "<Home>")
vim.keymap.set({ "c", "i" }, "<C-B>", "<Left>")
vim.keymap.set({ "c", "i" }, "<C-F>", "<Right>")
vim.keymap.set({ "c", "i" }, "<C-D>", "<Del>")

-- this is obnoxious with my colemak mappings, and often causes me to delete
-- an extra character in visual block mode
vim.keymap.del({"v"}, "in")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.keymap.set({ "n" }, "q", ":q<CR>", { silent = true, buffer = true })
    end
})

require("colors")
require("functions")
require("gui-settings")
require("plugins")
require("lsp-settings")
