" vim: filetype=vim
"Settings for GUI

" set the initial window size
"set co=160
set lines=100

" enabling the use of the meta key (alt/option) on the Mac
if has("mac")
  set macmeta
endif
set fuoptions=maxvert,maxhorz
" Remove all the UI cruft
set go=egm

" add marker for when changing something
set cpo+=$

" Set spellcheck settings
highlight SpellBad term=underline gui=undercurl guisp=Orange

if g:use_custom_cursors
  " Cursor color for diferent {{{
  hi Cursor   guifg=#303030 guibg=#afd787
  hi iCursor  guifg=#444444 guibg=#87afd7
  hi vCursor  guifg=#303030 guibg=#d7afd7
  hi rCursor  guifg=#303030 guibg=#d78787
  " }}}

  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  set guicursor+=i-ci:ver20-iCursor
  set guicursor+=r-cr:hor20-rCursor
endif

"Sets a better font depending on system
function! s:initialize_font()
  if exists("&guifont")
    if has("mac")
      if g:airline_powerline_fonts
        set guifont=Monaco:h12
      else
        set guifont=Monaco:h13
      endif
    elseif has("unix")
      if &guifont == ""
        set guifont=bitstream\ vera\ sans\ mono\ 12
      endif
    elseif has("win32")
      set guifont=Consolas:h11,Courier\ New:h12
    endif
  endif
endfunction
augroup RCVisual
  autocmd!
  autocmd GUIEnter *  call s:initialize_font()
augroup END
