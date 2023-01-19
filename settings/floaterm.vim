let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" Set default shell
" let g:floaterm_shell = ''

" Set floaterm title
let g:floaterm_title='Terminal $1/$2'

" Set default floaterm width
let g:floaterm_width=0.6

" Set default floaterm height
let g:floaterm_height=0.7

" Set default exiting mode
" 0: Always do NOT close floaterm window
" 1: Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
" 2: Always close floaterm window
let g:floaterm_autoclose=1

" Type of window
" Set it to 'split' or 'vsplit' if you don't want to use floating or popup window.
let g:floaterm_wintype='float'

" Set floaterm window's background to black
hi Floaterm guibg=green
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan

nnoremap <silent> <leader>fn :FloatermNew --height=0.7 --width=0.6 --wintype=float --position=topright<CR>
