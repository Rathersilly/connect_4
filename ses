let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/the_odin_project/connect_4_tdd
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 connect_4.rb
badd +1 player.rb
badd +1 board.rb
badd +1 2
badd +1 spec/connect_4_spec.rb
badd +0 spec/board_spec.rb
argglobal
silent! argdel *
$argadd connect_4.rb
set stal=2
edit connect_4.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 45 + 34) / 68)
exe '2resize ' . ((&lines * 19 + 34) / 68)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 49 - ((43 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 0
wincmd w
argglobal
if bufexists('board.rb') | buffer board.rb | else | edit board.rb | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 17 - ((12 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 021|
wincmd w
exe '1resize ' . ((&lines * 45 + 34) / 68)
exe '2resize ' . ((&lines * 19 + 34) / 68)
tabedit spec/connect_4_spec.rb
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 32 + 34) / 68)
exe '2resize ' . ((&lines * 32 + 34) / 68)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('spec/board_spec.rb') | buffer spec/board_spec.rb | else | edit spec/board_spec.rb | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 32 + 34) / 68)
exe '2resize ' . ((&lines * 32 + 34) / 68)
tabnext 2
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
