function! SpaceVim#layers#fold_by_regexp#plugins() abort
    return [
                \ ['ZSaberLv0/ZFVimFoldBlock'],
                \ ]
endfunction

function! SpaceVim#layers#fold_by_regexp#config() abort
    nnoremap ZB q::call ZF_FoldBlockTemplate()<cr>
    nnoremap ZF :ZFFoldBlock //<left>
    function! ZF_Plugin_ZFVimFoldBlock_comment()
        let expr='\(^\s*\/\/\)'
        if &filetype=='vim'
            let expr.='\|\(^\s*"\)'
        endif
        if &filetype=='c' || &filetype=='cpp'
            let expr.='\|\(^\s*\(\(\/\*\)\|\(\*\)\)\)'
        endif
        if &filetype=='make'
            let expr.='\|\(^\s*#\)'
        endif
        let disableE2vSaved = g:ZFVimFoldBlock_disableE2v
        let g:ZFVimFoldBlock_disableE2v = 1
        call ZF_FoldBlock("/" . expr . "//")
        let g:ZFVimFoldBlock_disableE2v = disableE2vSaved
        echo "comments folded"
    endfunction
    nnoremap ZC :call ZF_Plugin_ZFVimFoldBlock_comment()<cr>
endfunction

