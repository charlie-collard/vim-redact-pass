"
" redact_pass.vim: Switch off the 'viminfo', 'backup', 'swapfile', and
" 'undofile' when editing passwords in the pass(1) password manager, or a
" comparable tool if g:redact_pass_pattern is set beforehand.
"
" This is to prevent anyone being able to extract passwords from your Vim
" cache files in the event of a compromise.
"
" Test this carefully to make sure it works! If it doesn't, it is probably
" because you need to set g:redact_pass_pattern to fit your system's
" behaviour, or the plugin hasn't loaded at all.
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
if exists('g:loaded_redact_pass') || &compatible
  finish
endif
if !has('autocmd')
  finish
endif
let g:loaded_redact_pass = 1

" Set g:redact_pass_pattern to a default based on the pass(1) code, if it
" hasn't already been set
if !exists('g:redact_pass_pattern')
  let g:redact_pass_pattern
        \ = '/dev/shm/pass.*/*,$TMPDIR/pass.*/*,/tmp/pass.*/*'
endif

" Function to switch the options off for just the current buffer
function! s:RedactPass()

  " Unset options
  setlocal nobackup
  setlocal nowritebackup
  setlocal noswapfile
  if has('viminfo')
    setlocal viminfo=
  endif
  if has('persistent_undo')
    setlocal noundofile
  endif

  " Set a buffer variable to say we were here, for debugging
  let b:redact_pass_active = 1

endfunction

" Automatic command to use the function based on filename pattern
let s:command = 'autocmd BufNewFile,BufReadPre '
      \ . g:redact_pass_pattern
      \ . ' call s:RedactPass()'
augroup redact_pass
  autocmd!
  execute s:command
augroup END
