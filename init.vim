
set number
set expandtab
set shiftwidth=4
set tabstop=4
set nowrap
set ignorecase smartcase

" ハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>

" コマンドモードへ移行する
noremap <C-j> :

" 行頭・行末へ移動する
noremap <C-h> ^
noremap <C-l> $

" アスタリスクを入力
noremap <C-k> *
noremap! <C-k> *

" 画面を再描画する
noremap gr :redraw<CR>

" レジスタを選択
noremap <C-e> "

" ペースト
noremap <C-i><C-i> p
noremap <C-i>0 "0p
noremap <C-i>1 "1p
noremap <C-i>2 "2p
noremap <C-i>3 "3p
noremap <C-i>4 "4p
noremap <C-i>5 "5p
noremap <C-i>6 "6p
noremap <C-i>7 "7p
noremap <C-i>8 "8p
noremap <C-i>9 "9p
noremap <C-i>a "ap
noremap <C-i>b "bp
noremap <C-i>c "cp
noremap <C-i>d "dp
noremap <C-i>e "ep
noremap <C-i>f "fp
noremap <C-i>g "gp
noremap <C-i>h "hp
noremap <C-i>i "ip
noremap <C-i>j "jp
noremap <C-i>k "kp
noremap <C-i>l "lp
noremap <C-i>m "mp
noremap <C-i>n "np
noremap <C-i>o "op
noremap <C-i>p "pp
noremap <C-i>q "qp
noremap <C-i>r "rp
noremap <C-i>s "sp
noremap <C-i>t "tp
noremap <C-i>u "up
noremap <C-i>v "vp
noremap <C-i>w "wp
noremap <C-i>x "xp
noremap <C-i>y "yp
noremap <C-i>z "zp
noremap <C-i>- "-p
noremap <C-i>* "*p
noremap <C-i>+ "+p
noremap <C-i>. ".p
noremap <C-i>: ":p
noremap <C-i>% "%p
noremap <C-i># "#p
noremap <C-I><C-I> P
noremap <C-I>0 "0P
noremap <C-I>1 "1P
noremap <C-I>2 "2P
noremap <C-I>3 "3P
noremap <C-I>4 "4P
noremap <C-I>5 "5P
noremap <C-I>6 "6P
noremap <C-I>7 "7P
noremap <C-I>8 "8P
noremap <C-I>9 "9P
noremap <C-I>a "aP
noremap <C-I>b "bP
noremap <C-I>c "cP
noremap <C-I>d "dP
noremap <C-I>e "eP
noremap <C-I>f "fP
noremap <C-I>g "gP
noremap <C-I>h "hP
noremap <C-I>i "iP
noremap <C-I>j "jP
noremap <C-I>k "kP
noremap <C-I>l "lP
noremap <C-I>m "mP
noremap <C-I>n "nP
noremap <C-I>o "oP
noremap <C-I>p "pP
noremap <C-I>q "qP
noremap <C-I>r "rP
noremap <C-I>s "sP
noremap <C-I>t "tP
noremap <C-I>u "uP
noremap <C-I>v "vP
noremap <C-I>w "wP
noremap <C-I>x "xP
noremap <C-I>y "yP
noremap <C-I>z "zP
noremap <C-I>- "-P
noremap <C-I>* "*P
noremap <C-I>+ "+P
noremap <C-I>. ".P
noremap <C-I>: ":P
noremap <C-I>% "%P
noremap <C-I># "#P

" Fernを呼び出す
noremap <C-y> :Fern . -reveal=%<CR>

" fzf
noremap gm :Marks<CR>
noremap gf :Files<CR>
noremap gb :Buffers<CR>

" f-next
nmap s :call FNext_n_f()<CR>
vmap s :call FNext_v_f()<CR>
omap s :call FNext_o_f()<CR>

" プラグインの読み込み
:lua require('plugins')

" easy-motion
let g:EasyMotion_leader_key = '<Space>'
map <Leader> <Plug>(easy-motion-prefix)

" showmarks
aug au-showmarks
au!
au VimEnter * DoShowMarks!
aug end

" treesitter
lua << EOF
  require'nvim-treesitter.configs'.setup {
    ignore_install = { "beancount", "fortran", "zig" },
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = { "beancount", "fortran", "zig" },
    },
  }
EOF

" fern
let g:fern#default_exclude = '\%(\.meta\)$'

let g:nvcode_termcolors=256

syntax on
colorscheme nvcode


if (has("termguicolors"))
  set termguicolors
  hi LineNr ctermbg=NONE guibg=NONE
endif

" coc
let g:coc_global_extensions = ['coc-flutter', 'coc-clangd', 'coc-omnisharp']

nmap gd <Plug>(coc-definition)
nmap <F2> <Plug>(coc-rename)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" fzf

" プレビューウィンドウを無効にする
let g:fzf_preview_window = []

aug au-insert
au!
  let zenhanPath = substitute($EXTERNAL_TOOLS . '\zenhan.exe 0', '\', '/', 'g')
  au InsertLeave * :call system(zenhanPath)

  " インサートモードの日本語入力の最中にアルファベット入力に切り替わってしまう場合があるので CmdlineLeave には設定しない
" au CmdlineLeave * :call system(zenhanPath)
aug end

