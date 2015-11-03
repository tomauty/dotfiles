function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

let g:startify_list_order = ['files']
let g:startify_list_order = [
  \[
  \ '                        /) ,  /)       ',
  \ '                        //    //  _  _  ',
  \ '                       /(__(_(/__(/_/_)_',
  \ '                      /)                ',
  \ '                     (/                 ',
  \], 'files']

let g:startify_custom_header=s:filter_header([
      \ '             #                    ',
      \ '            ###                   ',
      \ '##           #                    ',
      \ '##                                ',
      \ ' ##    ### ###   ### /### /###    ',
      \ '  ##    ### ###   ##/ ###/ /##  / ',
      \ '  ##     ### ##    ##  ###/ ###/  ',
      \ '  ##      ## ##    ##   ##   ##   ',
      \ '  ##      ## ##    ##   ##   ##   ',
      \ '  ##      ## ##    ##   ##   ##   ',
      \ '  ##      ## ##    ##   ##   ##   ',
      \ '  ##      /  ##    ##   ##   ##   ',
      \ '   ######/   ### / ###  ###  ###  ',
      \'    #####     ##/   ###  ###  ### ',
      \ ])



