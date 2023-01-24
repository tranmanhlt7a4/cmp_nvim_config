let g:bookmark_sign = '🔖'    "'♥'
let g:bookmark_annotation_sign = '📝'

nmap <C-b>b <Plug>BookmarkToggle
nmap <C-b>i <Plug>BookmarkAnnotate
nmap <C-b>a <Plug>BookmarkShowAll
nmap <C-b>j <Plug>BookmarkNext
nmap <C-b>k <Plug>BookmarkPrev
nmap <C-b>c <Plug>BookmarkClear
nmap <C-b>x <Plug>BookmarkClearAll
nmap <C-b>kk <Plug>BookmarkMoveUp
nmap <C-b>jj <Plug>BookmarkMoveDown
nmap <C-b>g <Plug>BookmarkMoveToLine