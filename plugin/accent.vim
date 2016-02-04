scriptencoding utf-8

set notildeop

if exists("g:loaded_accent") || &cp
  finish
endif
let g:loaded_accent = 1

let s:lists = [
  \ ['a','ä','à','â'],
  \ ['A','Ä','À','Â'],
  \ ['e','é','è','ê'],
  \ ['E','É','Ê','È'],
  \ ['i','î'],
  \ ['I','Î'],
  \ ['o','ö','ô'],
  \ ['O','Ö','Ô'],
  \ ['s','ß'],
  \ ['u','ü','û','ù'],
  \ ['U','Ü','Û','Ù'],
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

nnoremap <silent><script> <Plug>(accent) :call <SID>cycle(matchstr(getline('.')[col('.')-1:-1],'.'))<CR>
if !hasmapto('<Plug>(accent)', 'n')
  nmap gx <Plug>(accent)
endif

