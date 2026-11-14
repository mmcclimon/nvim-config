-- text editing
vim.opt.smartindent = true	-- indent braces automatically
vim.opt.cinwords = ""		-- turn off weird magic indent
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
vim.opt.wildignore:append({".git","local","build","vendor"})
vim.opt.list = true
vim.opt.listchars = { tab = ">-", trail = "~", extends = ">", precedes = "<" }

vim.opt.foldlevelstart=99
vim.opt.foldopen:remove({"block"})

vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.config/nvim/backup")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
      vim.opt_local.textwidth = 72
  end
})

local trailing = vim.api.nvim_create_augroup('trailing', { clear = true })

vim.api.nvim_create_autocmd({'InsertEnter'}, {
  pattern = '*',
  group = trailing,
  callback = function() vim.opt_local.listchars:remove({"trail"}) end
})

vim.api.nvim_create_autocmd({'InsertLeave'}, {
  pattern = '*',
  group = trailing,
  callback = function() vim.opt_local.listchars:append({trail = "~"}) end
})

--[[

def g:SyntaxItem(): string
    return synIDattr(synID(line("."), col("."), 0), "name")
enddef

# Folding
augroup folding
    au!
    au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

# }}}

# Mappings ----------------------------------------------------{{{
# popupmenu bindings
inoremap <expr><C-e> pumvisible() ? "\<C-p>" : "\<C-e>"

# }}}

# Misc. settings {{{
# ------------------

g:tex_flavor = "latex"      # plaintex is no good
g:perl_sub_signatures = 1     # new perls!

# fix crontab bug
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

# }}}

# Imports {{{
# -----------
so ~/.vim/functions.vim   # load custom functions
so ~/.vim/plugins.vim     # load plugin settings
so ~/.vim/ale_settings.vim
so ~/.vim/abbrevs.vim     # I can't type
so ~/.vim/mto.vim         # mto nonsense
so ~/.vim/colors.vim      # for patching
# }}}

# vim:fdm=marker
# vim:set filetype=vim

--]]
-- mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"
vim.keymap.set({ "n" }, "<Leader>s", '<cmd>:nohlsearch<cr>')

-- swap colon + semicolon
vim.keymap.set({"n", "v", "o"}, ";", ":")
vim.keymap.set({"n", "v", "o"}, ":", ";")
vim.keymap.set({"n", "v", "o"}, "<Space>", ":")

-- better window motion
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- colemak stuff
-- modal swapping
vim.keymap.set({"n", "v", "o"}, "u", "i")
vim.keymap.set({"n", "v", "o"}, "U", "I")

-- hjkl = hnei
vim.keymap.set({"n", "v", "o"}, "h", "h")
vim.keymap.set({"n", "v", "o"}, "n", "j")
vim.keymap.set({"n", "v", "o"}, "e", "k")
vim.keymap.set({"n", "v", "o"}, "i", "l")
vim.keymap.set({"n", "v", "o"}, "H", "H")
vim.keymap.set({"n", "v", "o"}, "N", "J")
vim.keymap.set({"n", "v", "o"}, "E", "K")
vim.keymap.set({"n", "v", "o"}, "I", "L")

-- stuff stolen by the above
vim.keymap.set({"n", "v", "o"}, "k", "n")
vim.keymap.set({"n", "v", "o"}, "K", "N")
vim.keymap.set({"n", "v", "o"}, "l", "u")
vim.keymap.set({"n", "v", "o"}, "L", "U")
vim.keymap.set({"n", "v", "o"}, "j", "e")
vim.keymap.set({"n", "v", "o"}, "J", "E")

vim.keymap.set({"n"}, "<BS>", "<C-^>")

-- vim-rsi mappings
vim.keymap.set({"i"}, "<C-A>", "<C-O>^")
vim.keymap.set({"c"}, "<C-A>", "<Home>")
vim.keymap.set({"c"}, "<C-B>", "<Left>")
vim.keymap.set({"c"}, "<C-F>", "<Right>")
vim.keymap.set({"c"}, "<C-D>", "<Del>")

require("colors")
require("functions")
require("gui_settings")
require("plugins")
require("lsp-settings")
