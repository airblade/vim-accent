scriptencoding utf-8
if exists("g:loaded_accent") || &cp
  finish
endif
let g:loaded_accent = 1

let s:lists = [
  \ ['a','ä','à','â','á'],
  \ ['A','Ä','À','Â','Á'],
  \ ['e','é','è','ê','ë'],
  \ ['E','É','Ê','È'],
  \ ['i','î','ï','í'],
  \ ['I','Î','Í'],
  \ ['o','ö','ô','ó'],
  \ ['O','Ö','Ô','Ó'],
  \ ['s','ß'],
  \ ['u','ü','û','ù','ú'],
  \ ['U','Ü','Û','Ù','Ú'],
  \ ['!','¡'],
  \ ['?','¿'],
  \ ['n','ñ'],
  \ ['N','Ñ'],
  \ ['!','¡'],
  \ ['?','¿'],
\ ]
function! s:cycle(char)
  for list in s:lists
    let index = index(list, a:char)
    if index != -1
      let replacement = list[ (index + 1) % len(list) ]
      silent execute 'normal! r'.replacement
      break
    endif
  endfor
endfunction

function! AccentCompletion(findstart, base)
  if a:findstart
    let char = getline('.')[col('.')-2]
    for list in s:lists
      let index = index(list, char)
      if index != -1
        return col('.') - 2
      endif
    endfor
    return -3

  elseif empty(a:base)
    " cargo culted
    return []

  else
    for list in s:lists
      let index = index(list, a:base)
      if index != -1
        return list
      endif
    endfor
    return []
  endif
endfunction

set completefunc=AccentCompletion

" Capture character under cursor in a way that works with multi-byte
" characters.  Credit to http://stackoverflow.com/a/23323958/151007.
nnoremap <silent><script> <Plug>(accent) :call <SID>cycle(matchstr(getline('.'), '\%'.col('.').'c.'))<CR>

if !hasmapto('<Plug>(accent)', 'n')
  nmap gx <Plug>(accent)
endif

