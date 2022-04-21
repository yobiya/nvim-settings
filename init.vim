
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

