local function strip_trailing_whitespace()
    local curpos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, curpos)
end

vim.keymap.set("n", "<Leader>w", strip_trailing_whitespace, { silent = true })

--[[
" Miscellaneous vim functions
" (plus bindings for them)
vim9script

# Save current view settings on a per-window, per-buffer basis.
def AutoSaveWinView()
    if !exists("w:SavedBufView")
        w:SavedBufView = {}
    endif
    w:SavedBufView[bufnr("%")] = winsaveview()
enddef

# Restore current view settings.
def AutoRestoreWinView()
    var buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        var v = winsaveview()
        var atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
enddef

def Colemak()
    # modal swapping
    noremap u i
    noremap U I

    # hjkl = hnei
    noremap h h
    noremap n j
    noremap e k
    noremap i l
    noremap H H
    noremap N J
    noremap E K
    noremap I L

    # stuff stolen by the above
    noremap k n
    noremap K N
    noremap l u
    noremap L U
    noremap j e
    noremap J E
    nnoremap <Space> :

    # vim-repeat blats the u mapping, so make sure it's loaded, then do that
    # mapping here.
    nmap l <Plug>(RepeatUndo)

    nnoremap <C-t> <C-f>
    nnoremap <C-f> <C-e>
enddef

Colemak()

# When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * AutoSaveWinView()
    autocmd BufEnter * AutoRestoreWinView()
endif

# }}}
--]]
